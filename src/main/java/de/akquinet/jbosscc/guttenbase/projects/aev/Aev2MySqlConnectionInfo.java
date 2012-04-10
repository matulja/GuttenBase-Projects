package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class Aev2MySqlConnectionInfo extends URLConnectionInfo {
  private static final long serialVersionUID = 1L;

  public Aev2MySqlConnectionInfo() {
    super("jdbc:mysql://localhost:3306/aev2", "kvbb", "aerzteverzeichnis", "com.mysql.jdbc.Driver", "aev2", DatabaseType.MYSQL);
  }
}
