package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.tools.postgresql.PostgresqlSequenceUpdater;

public class MeylePostgresqlSequenceUpdater extends PostgresqlSequenceUpdater {
  public MeylePostgresqlSequenceUpdater(final ConnectorRepository connectorRepository) {
    super(connectorRepository);
  }

  @Override
  public String getSequenceName(final String tableName) throws SQLException {
    final String lowerCase = tableName.toLowerCase();
    final int index = lowerCase.indexOf("drools_");

    if (index > 0) {
      return super.getSequenceName(tableName.substring(0, index) + tableName.substring(index + 7));
    } else {
      return super.getSequenceName(tableName);
    }
  }
}
