package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class MeylePostgresqlConnectionInfo extends URLConnectionInfo {
  private static final long serialVersionUID = 1L;

  public MeylePostgresqlConnectionInfo() {
    super("jdbc:postgresql://localhost:5432/meyle-devA", "meyle", "meylenstein", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
  }
}
