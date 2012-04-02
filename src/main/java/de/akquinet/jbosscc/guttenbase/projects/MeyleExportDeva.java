package de.akquinet.jbosscc.guttenbase.projects;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

public class MeyleExportDeva {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo("meyleExport", new ExportDumpConnectionInfo("meyleMsSql", "deva.dump"));
      connectorRepository.addConnectionInfo("meyleMsSql", new MeyleMsSqlConnectionInfo());

      new DefaultTableCopier(connectorRepository).copyTables("meyleMsSql", "meyleExport");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
