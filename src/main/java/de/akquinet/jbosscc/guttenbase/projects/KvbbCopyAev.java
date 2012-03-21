package de.akquinet.jbosscc.guttenbase.projects;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
import de.akquinet.jbosscc.guttenbase.tools.TableConfigurationChecker;
import de.akquinet.jbosscc.guttenbase.tools.TableDataChecker;

public class KvbbCopyAev {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      final AevTableNameFilterHint tableNameHint = new AevTableNameFilterHint();

      connectorRepository.addConnectionInfo("aevMySql", new AevMySqlConnectionInfo());
      connectorRepository.addConnectionInfo("aevExport", new ExportDumpConnectionInfo("aevMySql", "/home/dahm/aev.dump"));
      connectorRepository.addConnectionInfo("aevImport", new ImportDumpConnectionInfo("/home/dahm/aev.dump"));
      connectorRepository.addConnectionInfo("aevPostgresql", new AevPostgresqlConnectionInfo());
      connectorRepository.addConnectionHint("aevMySql", tableNameHint);
      connectorRepository.addConnectionHint("aevMySql", new AevSplitByColumnHint());
      connectorRepository.addConnectionHint("aevExport", tableNameHint);
      connectorRepository.addConnectionHint("aevImport", tableNameHint);
      connectorRepository.addConnectionHint("aevPostgresql", tableNameHint);

      new TableConfigurationChecker(connectorRepository).checkTableConfiguration("aevMySql", "aevExport");
      new TableConfigurationChecker(connectorRepository).checkTableConfiguration("aevMySql", "aevPostgresql");
      new DefaultTableCopier(connectorRepository).copyTables("aevMySql", "aevExport");
      // new SplitByRangeTableCopier(connectorRepository).copyTables("aevMySql", "aevExport");

      new DefaultTableCopier(connectorRepository).copyTables("aevImport", "aevPostgresql");
      new TableDataChecker(connectorRepository).checkTableData("aevMySql", "aevPostgresql");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
