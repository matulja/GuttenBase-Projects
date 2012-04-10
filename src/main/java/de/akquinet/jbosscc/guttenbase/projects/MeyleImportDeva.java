package de.akquinet.jbosscc.guttenbase.projects;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.SplitColumn;
import de.akquinet.jbosscc.guttenbase.hints.SplitColumnHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
import de.akquinet.jbosscc.guttenbase.tools.TableConfigurationChecker;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlSequenceUpdater;

public class MeyleImportDeva {
  private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo("meyleImport", new ImportDumpConnectionInfo("deva.dump"));
      connectorRepository.addConnectionInfo("meylePostgresql", new MeylePostgresqlConnectionInfo());
      connectorRepository.addConnectionHint("meyleImport", new MeyleTableNameFilterHint());
      connectorRepository.addConnectionHint("meylePostgresql", new MeyleTableNameFilterHint());

      // try {
      // new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
      // } catch (final SQLException e) {
      // LOG.error("drop", e);
      // }
      //
      // new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql.ddl");

      new TableConfigurationChecker(connectorRepository).checkTableConfiguration("meyleImport", "meylePostgresql");
      new DefaultTableCopier(connectorRepository).copyTables("meyleImport", "meylePostgresql");

      connectorRepository.addConnectionHint("meylePostgresql", new SplitColumnHint() {

        @Override
        public SplitColumn getValue() {
          // TODO Auto-generated method stub
          return null;
        }
      });

      new PostgresqlSequenceUpdater(connectorRepository).updateSequences("meylePostgresql");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
