package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.File;
import java.math.BigDecimal;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.configuration.impl.H2DbTargetDatabaseConfiguration;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;

public class MeyleImportH2 {
  private static final String TARGET = "H2";
  private static final String SOURCE = "DUMP";
  private static final Logger LOG = Logger.getLogger(MeyleImportH2.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(new File("deva-postgresql.jar").toURI().toURL()));
      connectorRepository.addConnectionInfo(TARGET, new H2ConnectionInfo());
      connectorRepository.addTargetDatabaseConfiguration(DatabaseType.H2DB, new H2DbTargetDatabaseConfiguration(connectorRepository));

      connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperProviderHint() {
        @Override
        protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory) {
          super.addMappings(columnDataMapperFactory);

          columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_LONG, new ColumnDataMapper() {
            @Override
            public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData)
                throws SQLException {
              return true;
            }

            @Override
            public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData, final Object value)
                throws SQLException {
              if (value != null) {
                final BigDecimal bigDecimal = (BigDecimal) value;

                return bigDecimal.longValue();
              } else {
                return null;
              }
            }
          });
        }
      });

      final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);
      // connectorRepository.addConnectorHint(TARGET, new ColumnTypeResolverListHint() {
      // @Override
      // public ColumnTypeResolverList getValue() {
      // return new ColumnTypeResolverList() {
      // @Override
      // public List<ColumnTypeResolver> getColumnTypeResolvers() {
      // return Arrays.asList(new ClassNameColumnTypeResolver(), new HeuristicColumnTypeResolver());
      // }
      // };
      // }
      //
      // });
      // Step 2: Recreate schema
      scriptExecutorTool.executeFileScript(TARGET, "/deva/deva-h2-1.1.5.ddl");

      // Step 3: Check schema compatibility
      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);

      // Step 4: Copy data
      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);
    } catch (final Exception e) {
      LOG.error("main", e);
    }
  }
}
