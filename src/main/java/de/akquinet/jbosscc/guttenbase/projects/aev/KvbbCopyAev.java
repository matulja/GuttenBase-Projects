package de.akquinet.jbosscc.guttenbase.projects.aev;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.SchemaCompatibilityChecker;
import de.akquinet.jbosscc.guttenbase.tools.TableDataChecker;

public class KvbbCopyAev {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      final AevTableNameFilterHint tableNameHint = new AevTableNameFilterHint();

      connectorRepository.addConnectionInfo("aevMySql", new AevMySqlConnectionInfo());
      connectorRepository.addConnectionInfo("aevExport", new ExportDumpConnectorInfo("aevMySql", "/home/dahm/aev.dump"));
      connectorRepository.addConnectionInfo("aevImport", new ImportDumpConnectionInfo("/home/dahm/aev.dump"));
      connectorRepository.addConnectionInfo("aevPostgresql", new AevPostgresqlConnectionInfo());
      connectorRepository.addConnectorHint("aevMySql", tableNameHint);
      connectorRepository.addConnectorHint("aevMySql", new AevSplitByColumnHint());
      connectorRepository.addConnectorHint("aevExport", tableNameHint);
      connectorRepository.addConnectorHint("aevImport", tableNameHint);
      connectorRepository.addConnectorHint("aevPostgresql", tableNameHint);

      new SchemaCompatibilityChecker(connectorRepository).checkTableConfiguration("aevMySql", "aevExport");
      new SchemaCompatibilityChecker(connectorRepository).checkTableConfiguration("aevMySql", "aevPostgresql");
      new DefaultTableCopyTool(connectorRepository).copyTables("aevMySql", "aevExport");
      // new SplitByRangeTableCopier(connectorRepository).copyTables("aevMySql", "aevExport");

      new DefaultTableCopyTool(connectorRepository).copyTables("aevImport", "aevPostgresql");
      new TableDataChecker(connectorRepository).checkTableData("aevMySql", "aevPostgresql");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
