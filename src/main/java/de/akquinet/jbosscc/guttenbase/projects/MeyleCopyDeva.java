package de.akquinet.jbosscc.guttenbase.projects;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
import de.akquinet.jbosscc.guttenbase.tools.TableConfigurationChecker;
import de.akquinet.jbosscc.guttenbase.tools.TableDataChecker;

public class MeyleCopyDeva {
  public static void main(final String[] args) throws SQLException {
    final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

    connectorRepository.addConnectionInfo("meylePostgres", new MeylePostgresqlConnectionInfo());
    connectorRepository.addConnectionHint("meylePostgres", new MeyleTableNameFilterHint());
    connectorRepository.addConnectionInfo("meyleMsSql", new MeyleMsSqlConnectionInfo());
    connectorRepository.addConnectionHint("meyleMsSql", new MeyleTableNameFilterHint());

    new TableConfigurationChecker(connectorRepository).checkTableConfiguration("meyleMsSql", "meylePostgres");
    new DefaultTableCopier(connectorRepository).copyTables("meyleMsSql", "meylePostgres");
    new TableDataChecker(connectorRepository).checkTableData("meyleMsSql", "meylePostgres");
  }
}
