package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.configuration.impl.PostgresqlTargetDatabaseConfiguration;
import de.akquinet.jbosscc.guttenbase.connector.ConnectorInfo;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.CaseConversionMode;
import de.akquinet.jbosscc.guttenbase.hints.ImportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.DropTablesTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlVacuumTablesTool;
import de.akquinet.jbosscc.guttenbase.tools.schema.CreateSchemaTool;
import de.akquinet.jbosscc.guttenbase.tools.schema.SchemaColumnTypeMapper;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Map.Entry;

public class MeyleImportDeva
{
  public static final String TARGET = "meylePostgresql";
  public static final String SOURCE = "meyleImport";
  private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);
  private static Map<String, Serializable> _extraInformation;
  public static final String GEHEIM = "rdsPXngmyFfXN20b2bwzwMVEeQourJYUSoryKxKYyUA=";
  private final ConnectorRepository _connectorRepository = new ConnectorRepositoryImpl();

  public void start()
  {
    final MeyleImportUI ui = new MeyleImportUI(this);
    ui.init();
    ui.start();
  }

  public void copy(String sourceId, String targetId) throws Exception
  {
    new DefaultTableCopyTool(_connectorRepository).copyTables(sourceId, targetId);
  }

  public void vacuumPostgres() throws SQLException
  {
    LOG.info("Run VACUUM ANALYZE");
    new PostgresqlVacuumTablesTool(_connectorRepository).executeOnAllTables(TARGET);
    LOG.info("VACUUM ANALYZE DONE");
  }

  public void updateUsers(String targetId) throws SQLException
  {
    final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(_connectorRepository);
    scriptExecutorTool.executeScript(targetId, "UPDATE deva_benutzer SET password = '" + GEHEIM + "';");

    // Step 7: Create Admin user (may already exist)
    try
    {
      scriptExecutorTool.executeScript(targetId, "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                      + "  VALUES (100001, 0,'markus.dahm@akquinet.de','markus.dahm@akquinet.de','Dahm, Markus','" + GEHEIM + "',1);",
              "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100001, 1);",
              //
              "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                      + "  VALUES (100002, 0,'lars.kuettner@akquinet.de','lars.kuettner@akquinet.de','Küttner, Lars','" + GEHEIM + "',1);",
              "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100002, 1);",
              //
              "INSERT INTO deva_benutzer (id,version,email,username,name,password,firma) "
                      + "  VALUES (100003, 0,'torsten.trzewik@akquinet.de','torsten.trzewik@akquinet.de', 'Trzewik, Torsten','" + GEHEIM
                      + "',1);", "INSERT INTO deva_benutzer_rollen (benutzer,rolle) VALUES (100003, 1);");
    }
    catch (final Exception e)
    {
      LOG.warn("Creating users failed", e);
    }
  }

  public void updateSequenceNumbers(String targetId) throws SQLException
  {
    final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(_connectorRepository);

    // Step 5: Update max sequence number
    _connectorRepository.addConnectorHint(targetId, new MeyleTableNameFilterHint(false, false));

    new MeylePostgresqlSequenceUpdateTool(_connectorRepository).updateSequences(targetId);

    for (final Entry<String, Serializable> entry : _extraInformation.entrySet())
    {
      scriptExecutorTool.executeScript(targetId, false, false,
              "SELECT setval('public." + entry.getKey().toLowerCase() + "', " + entry.getValue() + ", true);");
    }
  }

  public void dropTables(final String targetId) throws SQLException
  {
    final DropTablesTool dropTablesTool = new DropTablesTool(_connectorRepository);
    dropTablesTool.dropForeignKeys(targetId);
    dropTablesTool.dropTables(targetId);
  }

  public void recreateSchema(final String sourceId, final String targetId) throws SQLException
  {
    final ConnectorInfo connectionInfo = _connectorRepository.getConnectionInfo(targetId);

    SchemaColumnTypeMapper schemaColumnTypeMapper = new MeyleSchemaColumnTypeMapper(connectionInfo);

    final CreateSchemaTool createSchemaTool = new CreateSchemaTool(_connectorRepository, schemaColumnTypeMapper,
            CaseConversionMode.UPPER);

    createSchemaTool.copySchema(sourceId, targetId);
    new CheckSchemaCompatibilityTool(_connectorRepository).checkTableConfiguration(sourceId, targetId);
  }

  public void setDumpFile(final File file) throws Exception
  {
    _connectorRepository.removeConnectionInfo(SOURCE);
    _connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(file.toURI().toURL()));

    _connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));

    _connectorRepository.addConnectorHint(SOURCE, new ImportDumpExtraInformationHint()
    {
      @Override
      public ImportDumpExtraInformation getValue()
      {
        return new ImportDumpExtraInformation()
        {
          @Override
          public void processExtraInformation(final Map<String, Serializable> extraInformation) throws Exception
          {
            _extraInformation = extraInformation;
          }
        };
      }
    });
  }

  public void setupConnections() throws MalformedURLException
  {

    _connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo());
    _connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));
//    _connectorRepository.addConnectorHint(TARGET, new SwingTableCopyProgressIndicatorHint());
//    _connectorRepository.addConnectorHint(TARGET, new SwingScriptExecutorProgressIndicatorHint());

    _connectorRepository.addTargetDatabaseConfiguration(DatabaseType.POSTGRESQL, new PostgresqlTargetDatabaseConfiguration(
            _connectorRepository, false));
  }

  public static void main(final String[] args)
  {
    MeyleImportDeva tool = new MeyleImportDeva();

    try
    {
      tool.setupConnections();
      tool.start();
    }
    catch (final Exception e)
    {
      LOG.error("main", e);
    }
  }
}
