package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.defaults.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckEqualTableDataTool;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlReindexTablesTool;
import org.apache.log4j.Logger;

import java.sql.SQLException;

public class TdmKaCopyWithUUID
{
  private static final Logger LOG = Logger.getLogger(TdmKaCopyWithUUID.class);

  private static final String SOURCE = "SOURCE";
  private static final String TARGET = "TARGET";

  public static void main(final String[] args)
  {
    try
    {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new TdmKaPostgresqlConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET, new TdmKaPostgresqlConnectionInfo2());

      connectorRepository.addConnectorHint(SOURCE, new TdmKaSourceTableNameFilterHint());
      final IdColumnDataMapper columnDataMapper = new IdColumnDataMapper();

      connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperProviderHint()
      {
        @Override
        protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory)
        {
          super.addMappings(columnDataMapperFactory);
          columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, columnDataMapper);
          columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, columnDataMapper);
        }
      });

      new ScriptExecutorTool(connectorRepository).executeFileScript(TARGET, "/tdmka/tdmka-uuid-postgresql.ddl");

      new PostgresqlReindexTablesTool(connectorRepository).executeOnAllTables(SOURCE);

      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

      new CheckEqualTableDataTool(connectorRepository).checkTableData(SOURCE, TARGET);

      new PostgresqlReindexTablesTool(connectorRepository).executeOnAllTables(TARGET);
    }
    catch (final SQLException e)
    {
      LOG.error("main", e);
    }
  }
}
