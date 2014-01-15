package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.File;
import java.io.Serializable;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.configuration.impl.PostgresqlTargetDatabaseConfiguration;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.ImportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.SwingScriptExecutorProgressIndicatorHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.SwingTableCopyProgressIndicatorHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlVacuumTablesTool;

public class MeyleImportDeva {
  private static final String TARGET = "meylePostgresql";
  private static final String SOURCE = "meyleImport";
  private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);
  private static Map<String, Serializable> _extraInformation;

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(new File("deva.jar").toURI().toURL()));
      connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));

      connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo());
      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));
      connectorRepository.addConnectorHint(TARGET, new SwingTableCopyProgressIndicatorHint());
      connectorRepository.addConnectorHint(TARGET, new SwingScriptExecutorProgressIndicatorHint());

      connectorRepository.addTargetDatabaseConfiguration(DatabaseType.POSTGRESQL, new PostgresqlTargetDatabaseConfiguration(
          connectorRepository, false));

      connectorRepository.addConnectorHint(SOURCE, new ImportDumpExtraInformationHint() {
        @Override
        public ImportDumpExtraInformation getValue() {
          return new ImportDumpExtraInformation() {

            @Override
            public void processExtraInformation(final Map<String, Serializable> extraInformation) throws Exception {
              _extraInformation = extraInformation;
            }
          };
        }
      });

      final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);

      // Step 1: Drop old schema
      try {
        scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.POSTGRESQL_DROP);
      } catch (final Exception e) {
        // May fail, if the schema does not exist yet
        LOG.warn("Drop table failed", e);
      }

      // Step 2: Recreate schema
      connectorRepository.refreshDatabaseMetaData(TARGET);
      scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.DEVA_DDL);

      // Step 3: Check schema compatibility
      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);

      // Step 4: Copy data
      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

      // Step 5: Update max sequence number
      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));

      new MeylePostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);

      for (final Entry<String, Serializable> entry : _extraInformation.entrySet()) {
        scriptExecutorTool.executeScript(TARGET, false, false,
            "SELECT setval('public." + entry.getKey().toLowerCase() + "', " + entry.getValue() + ", true);");
      }

      // Step 6: Execute delta scripts
      // scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.DELTA1);

      // Step 7: Create Admin user (may already exist)
      try {
        scriptExecutorTool
            .executeScript(
                TARGET,
                "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                    + "  VALUES (100001, 0,'markus.dahm@akquinet.de','markus.dahm@akquinet.de','Dahm, Markus','+KfB6ktN4I+tK8EnDDRpbs5SuQZhX/HqZSN07k2uTJc=',1);",
                "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100001, 1);",
                //
                "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                    + "  VALUES (100002, 0,'lars.kuettner@akquinet.de','lars.kuettner@akquinet.de','Küttner, Lars','ob6X0sKtYKEi5vkBJefh0vE/d0IyKDe4OIPeYMNxSQ8=',1);",
                "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100002, 1);",
                //
                "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                    + "  VALUES (100003, 0,'torsten.trzewik@akquinet.de','torsten.trzewik@akquinet.de', 'Trzewik, Torsten','XwICIwDcu+mP9ZQaQpFo/AO5ycZyGkB4zKE1W0iVejM=',1);",
                "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100003, 1);");
      } catch (final Exception e) {
        LOG.warn("Creating markus.dahm@akquinet.de user failed", e);
      }

      LOG.info("Run VACUUM ANALYZE");
      new PostgresqlVacuumTablesTool(connectorRepository).executeOnAllTables(TARGET);
      LOG.info("VACUUM ANALYZE DONE");
    } catch (final Exception e) {
      LOG.error("main", e);
    }
  }
}
