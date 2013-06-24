package de.akquinet.jbosscc.guttenbase.projects.ubi;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class UbiAekLocalMySqlConnectionInfo extends URLConnectorInfoImpl
{
  private static final long serialVersionUID = 1L;

  public UbiAekLocalMySqlConnectionInfo()
  {
    super("jdbc:mysql://localhost:3306/lokalubi", "ubiusr", "geheim", "com.mysql.jdbc.Driver", "lokalubi", DatabaseType.MYSQL);
  }
}
