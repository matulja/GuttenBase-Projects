package de.akquinet.jbosscc.guttenbase.projects.ubi;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.ColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class UbiAekCopyDb
{
  private static final Logger LOG = Logger.getLogger(UbiAekCopyDb.class);
  public static final String SOURCE = "SOURCE";
  public static final String TARGET_LOKAL = "TARGET";
  public static final String TARGET_E = "TARGET_E";
  public static final String DUMP_EXPORT = "DUMP_EXPORT";
  public static final String DUMP_IMPORT = "DUMP_IMPORT";

  public static void main(final String[] args)
  {
    try
    {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      //      connectorRepository.addConnectionInfo(SOURCE, new UbiAekQConnectionInfo());
      //      connectorRepository.addConnectionInfo(TARGET_E, new UbiAekEConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET_LOKAL, new UbiAekLocalMySqlConnectionInfo());
      //      connectorRepository.addConnectionInfo(DUMP_EXPORT, new ExportDumpConnectorInfo(SOURCE, "ubi-aek-q.dump"));
      connectorRepository
          .addConnectionInfo(DUMP_IMPORT, new ImportDumpConnectionInfo(new File("ubi-aek-q.dump").toURI().toURL()));

      connectorRepository.addConnectorHint(TARGET_LOKAL, new ColumnMapperHint()
      {
        @Override
        public ColumnMapper getValue()
        {
          return new DefaultColumnMapper()
          {
            @Override
            public ColumnMapperResult map(final ColumnMetaData source, final TableMetaData targetTableMetaData)
                throws SQLException
            {
              if (source.getColumnName().equalsIgnoreCase("BEMERKUNG")//
                  || source.getColumnName().equalsIgnoreCase("VOLLZEIT_LIGHT")//
                  || source.getColumnName().equalsIgnoreCase("ORG_HALTUNG_BEMERKUNG")//
                  || source.getColumnName().equalsIgnoreCase("HALTUNG_BEMERKUNG"))
              {
                return new ColumnMapperResult(new ArrayList<ColumnMetaData>(), true);
              }
              else
              {
                return super.map(source, targetTableMetaData);
              }
            }
          };
        }
      });

      connectorRepository.addConnectorHint(TARGET_LOKAL, new DefaultColumnDataMapperProviderHint()
      {
        @Override
        protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory)
        {
          super.addMappings(columnDataMapperFactory);

          columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_INTEGER, new ColumnDataMapper()
          {
            @Override
            public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData)
                throws SQLException
            {
              return true;
            }

            @Override
            public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData,
                final Object value) throws SQLException
            {
              return value != null ? ((Long) value).intValue() : null;
            }
          });
        }
      });

      //      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, DUMP);

      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(DUMP_IMPORT, TARGET_LOKAL);
      new DefaultTableCopyTool(connectorRepository).copyTables(DUMP_IMPORT, TARGET_LOKAL);
      //      new CheckEqualTableDataTool(connectorRepository).checkTableData(SOURCE, TARGET_LOKAL);
    }
    catch (final Exception e)
    {
      LOG.error("main", e);
    }
  }
}
