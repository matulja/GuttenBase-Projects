package de.akquinet.jbosscc.guttenbase.projects.ubi;

import de.akquinet.jbosscc.guttenbase.defaults.impl.DroppingColumnMapper;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.ColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckEqualTableDataTool;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.db2.Db2ReorgIndexesTablesTool;
import de.akquinet.jbosscc.guttenbase.tools.db2.Db2ReorgTablesTool;
import org.apache.log4j.Logger;

import java.io.File;
import java.sql.SQLException;

public class UbiAekCopyFromKN97
{
  private static final Logger LOG = Logger.getLogger(UbiAekCopyFromKN97.class);

  public static final String SOURCE_Q = "SOURCE";
  public static final String TARGET_LOKAL = "TARGET";
  public static final String TARGET_E = "TARGET_E";
  public static final String TARGET_DUMP = "DUMP_EXPORT";
  public static final String SOURCE_DUMP = "DUMP_IMPORT";

  private final ConnectorRepository _connectorRepository = new ConnectorRepositoryImpl();

  public void setupConnections() throws Exception
  {
    _connectorRepository.addConnectionInfo(SOURCE_Q, new UbiAekQConnectionInfo());
    _connectorRepository.addConnectionInfo(TARGET_E, new UbiAekEConnectionInfo());
    _connectorRepository.addConnectionInfo(TARGET_LOKAL, new UbiAekLocalMySqlConnectionInfo());
    _connectorRepository.addConnectionInfo(TARGET_DUMP, new ExportDumpConnectorInfo(SOURCE_Q, "ubi-aek-q.dump"));
    _connectorRepository.addConnectionInfo(SOURCE_DUMP, new ImportDumpConnectionInfo(new File("ubi-aek-q.dump").toURI().toURL()));
  }

  public void setupConnectionHints() throws Exception
  {
    _connectorRepository.addConnectorHint(SOURCE_DUMP, new CopyEdBerichtFirstOrder());

    // Sind im Schema noch vorhanden, werden aber nicht mehr benutzt
    final DroppingColumnMapper droppingColumnMapper = new DroppingColumnMapper();
    droppingColumnMapper.addDroppedColumn("HALTUNG", "BEMERKUNG");
    droppingColumnMapper.addDroppedColumn("BAUWERKE", "BEMERKUNG");
    droppingColumnMapper.addDroppedColumn("KANALZUSTANDRUECKMELDUNG", "HALTUNG_BEMERKUNG");
    droppingColumnMapper.addDroppedColumn("KANALZUSTANDRUECKMELDUNG", "ORG_HALTUNG_BEMERKUNG");
    droppingColumnMapper.addDroppedColumn("FREIZEIT_ANSPRUECHE", "VOLLZEIT_LIGHT");

    _connectorRepository.addConnectorHint(TARGET_E, new ColumnMapperHint()
    {
      @Override
      public ColumnMapper getValue()
      {
        return droppingColumnMapper;
      }
    });
  }

  public void start() throws Exception
  {
    //    new DefaultTableCopyTool(_connectorRepository).copyTables(SOURCE_Q, TARGET_DUMP);

    new CheckSchemaCompatibilityTool(_connectorRepository).checkTableConfiguration(SOURCE_DUMP, TARGET_E);
    new DefaultTableCopyTool(_connectorRepository).copyTables(SOURCE_DUMP, TARGET_E);
    new Db2ReorgIndexesTablesTool(_connectorRepository).executeOnAllTables(TARGET_E);
    new Db2ReorgTablesTool(_connectorRepository).executeOnAllTables(TARGET_E);
    new CheckEqualTableDataTool(_connectorRepository).checkTableData(SOURCE_Q, TARGET_E);
  }

  public static void main(final String[] args)
  {
    final UbiAekCopyFromKN97 tool = new UbiAekCopyFromKN97();

    try
    {
      tool.setupConnections();
      tool.setupConnectionHints();
      tool.start();
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
