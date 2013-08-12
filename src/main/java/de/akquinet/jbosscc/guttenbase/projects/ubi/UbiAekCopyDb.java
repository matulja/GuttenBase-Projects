package de.akquinet.jbosscc.guttenbase.projects.ubi;

import java.io.File;
import java.sql.SQLException;
import java.util.Comparator;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.ColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DroppingColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableOrderComparatorFactory;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckEqualTableDataTool;
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

      connectorRepository.addConnectionInfo(SOURCE, new UbiAekQConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET_E, new UbiAekEConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET_LOKAL, new UbiAekLocalMySqlConnectionInfo());
      connectorRepository.addConnectionInfo(DUMP_EXPORT, new ExportDumpConnectorInfo(SOURCE, "ubi-aek-q.dump"));
      connectorRepository
          .addConnectionInfo(DUMP_IMPORT, new ImportDumpConnectionInfo(new File("ubi-aek-q.dump").toURI().toURL()));

      connectorRepository.addConnectorHint(DUMP_IMPORT, new TableOrderHint()
      {
        @Override
        public TableOrderComparatorFactory getValue()
        {
          return new TableOrderComparatorFactory()
          {
            @Override
            public Comparator<TableMetaData> createComparator()
            {
              return new Comparator<TableMetaData>()
              {
                @Override
                public int compare(final TableMetaData t1, final TableMetaData t2)
                {
                  if (t1.getTableName().equalsIgnoreCase("EDBERICHT"))
                  {
                    return -1;
                  }
                  else if (t2.getTableName().equalsIgnoreCase("EDBERICHT"))
                  {
                    return 1;
                  }
                  else
                  {
                    return t1.compareTo(t2);
                  }
                }
              };
            }
          };
        }
      });

      // Sind im Schema noch vorhanden, werden aber nicht mehr benutzt
      final DroppingColumnMapper droppingColumnMapper = new DroppingColumnMapper();
      droppingColumnMapper.addDroppedColumn("HALTUNG", "BEMERKUNG");
      droppingColumnMapper.addDroppedColumn("BAUWERKE", "BEMERKUNG");
      droppingColumnMapper.addDroppedColumn("KANALZUSTANDRUECKMELDUNG", "HALTUNG_BEMERKUNG");
      droppingColumnMapper.addDroppedColumn("KANALZUSTANDRUECKMELDUNG", "ORG_HALTUNG_BEMERKUNG");
      droppingColumnMapper.addDroppedColumn("FREIZEIT_ANSPRUECHE", "VOLLZEIT_LIGHT");

      connectorRepository.addConnectorHint(TARGET_E, new ColumnMapperHint()
      {
        @Override
        public ColumnMapper getValue()
        {
          return droppingColumnMapper;
        }
      });

      //      connectorRepository.addConnectorHint(TARGET_E, new DefaultColumnDataMapperProviderHint()
      //      {
      //        @Override
      //        protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory)
      //        {
      //          super.addMappings(columnDataMapperFactory);
      //
      //          columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_INTEGER, new ColumnDataMapper()
      //          {
      //            @Override
      //            public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData)
      //                throws SQLException
      //            {
      //              return true;
      //            }
      //
      //            @Override
      //            public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData,
      //                final Object value) throws SQLException
      //            {
      //              return value != null ? ((Long) value).intValue() : null;
      //            }
      //          });
      //        }
      //      });

      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(DUMP_IMPORT, TARGET_E);
      new DefaultTableCopyTool(connectorRepository).copyTables(DUMP_IMPORT, TARGET_E);
      new CheckEqualTableDataTool(connectorRepository).checkTableData(SOURCE, TARGET_E);
    }
    catch (final SQLException e)
    {
      LOG.error("main", e);
      LOG.error("main", e.getNextException());
    }
    catch (final Exception e)
    {
      LOG.error("main", e);
    }
  }
}
