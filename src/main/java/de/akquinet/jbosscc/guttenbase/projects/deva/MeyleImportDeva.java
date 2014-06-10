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
import de.akquinet.jbosscc.guttenbase.tools.mysql.MySqlReorgTablesTool;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlVacuumTablesTool;
import de.akquinet.jbosscc.guttenbase.tools.schema.CreateSchemaTool;
import de.akquinet.jbosscc.guttenbase.tools.schema.SchemaColumnTypeMapper;
import de.akquinet.jbosscc.guttenbase.utils.ResourceUtil;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.Serializable;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class MeyleImportDeva
{
  public static final String TARGET = "TARGET";
  public static final String SOURCE = "SOURCE";
  private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);
  private static Map<String, Serializable> _extraInformation;
  public static final String GEHEIM = "rdsPXngmyFfXN20b2bwzwMVEeQourJYUSoryKxKYyUA=";
  private final ConnectorRepository _connectorRepository = new ConnectorRepositoryImpl();
  private MeyleImportUI _importUI = new MeyleImportUI(this);

  public void start()
  {
    _importUI.init();
    _importUI.start();
  }

  public void copy(String sourceId, String targetId) throws Exception
  {
    new DefaultTableCopyTool(_connectorRepository).copyTables(sourceId, targetId);
  }

  public void reorgTables(String targetId) throws SQLException
  {
    final DatabaseType databaseType = _connectorRepository.getConnectionInfo(targetId).getDatabaseType();

    if (databaseType == DatabaseType.POSTGRESQL)

    {
      new PostgresqlVacuumTablesTool(_connectorRepository).executeOnAllTables(targetId);
    }

    else if (databaseType == DatabaseType.MYSQL)

    {
      new MySqlReorgTablesTool(_connectorRepository).executeOnAllTables(targetId);
    }
  }

  public void updateUsers(String targetId) throws SQLException
  {
    final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(_connectorRepository);
    scriptExecutorTool.executeScript(targetId, "UPDATE deva_benutzer SET password = '" + GEHEIM + "';");

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

  public void recreateAndUpdateSequences(final String targetId) throws SQLException
  {
    final List<String> statements = new ArrayList<String>();
    final DatabaseType databaseType = _connectorRepository.getConnectionInfo(targetId).getDatabaseType();
    _connectorRepository.getDatabaseMetaData(SOURCE); // Make sure extra info is read

    if (databaseType == DatabaseType.POSTGRESQL)
    {
      for (final Entry<String, Serializable> entry : _extraInformation.entrySet())
      {
        String tableName = entry.getKey().toLowerCase();

        if (tableName.startsWith("dbo.")) // workaround
        {
          tableName = tableName.substring(4);
        }

        Long nextSequenceNumber = (Long) entry.getValue();

        String sequenceName = tableName.startsWith("deva_") ? getIdSequenceName(tableName) : tableName;

        if (tableName.startsWith("deva_") || DevaSequenceNumberExporter.DEVA_SEQUENCETABLES.contains(tableName.toUpperCase()))
        {
          statements.add("DROP SEQUENCE IF EXISTS " + sequenceName + " CASCADE;");
          statements.add("CREATE SEQUENCE " + sequenceName + " START WITH 1 INCREMENT BY 1;");

          if (tableName.startsWith("deva_"))
          {
            statements.add("ALTER SEQUENCE " + sequenceName + " OWNED BY " + tableName + ".ID;");
            statements.add("ALTER TABLE ONLY " + tableName + " ALTER COLUMN ID SET DEFAULT nextval('" + sequenceName + "'::regclass);");
          }

          statements.add("SELECT SETVAL('" + sequenceName + "', " + nextSequenceNumber + ", true);");
        }
      }
    }
    else if (databaseType == DatabaseType.MYSQL)
    {
      for (final Entry<String, Serializable> entry : _extraInformation.entrySet())
      {
        String tableName = entry.getKey().toLowerCase();
        final Long nextSequenceNumber = (Long) entry.getValue();

        if (tableName.startsWith("dbo."))// workaround
        {
          tableName = tableName.substring(4);
        }

        if (tableName.startsWith("deva_"))
        {
          statements.add("ALTER TABLE " + tableName + " CHANGE COLUMN ID ID BIGINT AUTO_INCREMENT NOT NULL;");
          statements.add("ALTER TABLE " + tableName + " AUTO_INCREMENT = " + nextSequenceNumber + ";");
        }
        else if (DevaSequenceNumberExporter.DEVA_SEQUENCETABLES.contains(tableName.toUpperCase()))
        {
          statements.add("DROP TABLE IF EXISTS " + tableName + " CASCADE;");
          statements.add("CREATE TABLE " + tableName + " (next_val BIGINT);");
          statements.add("INSERT INTO " + tableName + " VALUES (" + nextSequenceNumber + ");");
        }
      }
    }

    new ScriptExecutorTool(_connectorRepository).executeScript(targetId, true, true, statements);
  }

  private String getIdSequenceName(final String tableName)
  {
    return tableName + "_id_seq";
  }

  public void setDumpFile(final File file) throws Exception
  {
    final URL url = file.toURI().toURL();

    _importUI.setTitle(url.toExternalForm());

    _connectorRepository.removeConnectionInfo(SOURCE);

    _connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(url));

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
            LOG.info("Additional information extracted from dump");
          }
        };
      }
    });
  }

  public void setupTarget(ConnectorInfo connectorInfo)
  {
    _connectorRepository.addConnectionInfo(TARGET, connectorInfo);
    _connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));

    _connectorRepository.addTargetDatabaseConfiguration(DatabaseType.POSTGRESQL, new PostgresqlTargetDatabaseConfiguration(
            _connectorRepository, false));
  }

  public static void main(final String[] args)
  {
    MeyleImportDeva tool = new MeyleImportDeva();

    try
    {
      final ResourceUtil.ResourceInfo resourceInfo = new ResourceUtil().getResourceInfo(MeyleImportDeva.class);

      if (resourceInfo.isJarFile())
      {
        tool.setDumpFile(resourceInfo.getJarFileOrFolder());
      }

      tool.start();
    }
    catch (final Exception e)
    {
      LOG.error("main", e);
    }
  }
}
