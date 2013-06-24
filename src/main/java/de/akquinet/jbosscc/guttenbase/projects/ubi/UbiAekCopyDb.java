package de.akquinet.jbosscc.guttenbase.projects.ubi;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckEqualTableDataTool;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class UbiAekCopyDb
{
  private static final Logger LOG = Logger.getLogger(UbiAekCopyDb.class);
  public static final String SOURCE = "SOURCE";
  public static final String TARGET = "TARGET";
  public static final String DUMP = "TARTARGETGET";

  public static void main(final String[] args)
  {
    try
    {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new UbiAekQConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET, new UbiAekLocalMySqlConnectionInfo());
      connectorRepository.addConnectionInfo(DUMP, new ExportDumpConnectorInfo(SOURCE, "ubi-aek-q.dump"));

      new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);
      new CheckEqualTableDataTool(connectorRepository).checkTableData(SOURCE, TARGET);
    }
    catch (final Exception e)
    {
      LOG.error("main", e);
    }
  }
}
