package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class AevPostgresqlConnectionInfo extends URLConnectionInfo {
  private static final long serialVersionUID = 1L;

  public AevPostgresqlConnectionInfo() {
    super("jdbc:postgresql://localhost:5432/aev", "kvbb", "aerzteverzeichnis", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
  }
}
