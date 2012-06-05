package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class MeyleExportDeva {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo("meyleMsSql", new MeyleMsSqlConnectionInfo());
      connectorRepository.addConnectionInfo("meyleExport", new ExportDumpConnectorInfo("meyleMsSql", "deva.jar"));

      new DefaultTableCopyTool(connectorRepository).copyTables("meyleMsSql", "meyleExport");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
