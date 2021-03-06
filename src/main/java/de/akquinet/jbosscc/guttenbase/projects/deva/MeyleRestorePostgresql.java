package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.File;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.configuration.impl.PostgresqlTargetDatabaseConfiguration;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlSequenceUpdateTool;

public class MeyleRestorePostgresql {
  private static final String TARGET = "meylePostgresql";
  private static final String SOURCE = "DUMP";
  private static final Logger LOG = Logger.getLogger(MeyleRestorePostgresql.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(new File("deva-postgresql.jar").toURI().toURL()));
      connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo());
      connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));
      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));
      connectorRepository.addTargetDatabaseConfiguration(DatabaseType.POSTGRESQL, new PostgresqlTargetDatabaseConfiguration(
          connectorRepository, false));

      final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);

      // Step 1: Drop old schema
      try {
        scriptExecutorTool.executeFileScript(TARGET, PostgresBackupClassResources.POSTGRESQL_DROP);
      } catch (final Exception e) {
        // May fail, if the schema does not exist yet
        LOG.warn("Drop table failed", e);
      }

      // Step 2: Recreate schema
      connectorRepository.refreshDatabaseMetaData(TARGET);
      scriptExecutorTool.executeFileScript(TARGET, PostgresBackupClassResources.DEVA_DDL);

      // Step 3: Check schema compatibility
      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);

      // Step 4: Copy data
      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

      // Step 5: Update max sequence number
      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));

      new PostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);
      //
      // for (final Entry<String, Serializable> entry : _extraInformation.entrySet()) {
      // scriptExecutorTool.executeScript(TARGET, false, false,
      // "SELECT setval('public." + entry.getKey().toLowerCase() + "', " + entry.getValue() + ", true);");
      // }
      //
      // // Step 6: Execute delta scripts
      // scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.DELTA1);
      // scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.DELTA2);
      // scriptExecutorTool.executeFileScript(TARGET, DevaExporterClassResources.DELTA3);
      //
      // // Step 7: Create Admin user (may already exist)
      // try {
      // scriptExecutorTool
      // .executeScript(
      // TARGET,
      // "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
      // +
      // "  VALUES (85, 0,'Lars.Kuettner@akquinet.de','Lars.Kuettner@akquinet.de','Kuettner, Lars','W9tA6KeRIqXFVT4jxp/h/wKy8juMP4o3DUXHehQjQ00=',1);",
      // "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (85,1);");
      // } catch (final Exception e) {
      // LOG.warn("Creating admin user failed", e);
      // }
    } catch (final Exception e) {
      LOG.error("main", e);
    }
  }
}
