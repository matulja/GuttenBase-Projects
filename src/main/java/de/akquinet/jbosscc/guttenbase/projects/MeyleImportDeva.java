package de.akquinet.jbosscc.guttenbase.projects;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutor;

public class MeyleImportDeva {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo("meyleImport", new ImportDumpConnectionInfo("deva.dump"));
      connectorRepository.addConnectionInfo("meylePostgresql", new MeylePostgresqlConnectionInfo());

      new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
      // new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql.ddl")

      // new DefaultTableCopier(connectorRepository).copyTables("meyleImport", "meylePostgresql");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
