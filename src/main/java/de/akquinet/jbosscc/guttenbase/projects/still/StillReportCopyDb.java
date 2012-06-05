package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
import de.akquinet.jbosscc.guttenbase.tools.SchemaCompatiblityChecker;

public class StillReportCopyDb {
  private static final Logger LOG = Logger.getLogger(StillReportCopyDb.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo("source", new StillReportMysqlConnectionInfo());
      connectorRepository.addConnectionInfo("target", new StillReportPostgresqlConnectionInfo());
      connectorRepository.addConnectorHint("source", new StillTableNameFilterHint());
      connectorRepository.addConnectorHint("target", new StillTableNameFilterHint());
      
      new SchemaCompatiblityChecker(connectorRepository).checkTableConfiguration("source", "target");
      new DefaultTableCopier(connectorRepository).copyTables("source", "target");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
