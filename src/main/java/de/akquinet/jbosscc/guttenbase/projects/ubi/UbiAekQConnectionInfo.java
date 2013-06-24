package de.akquinet.jbosscc.guttenbase.projects.ubi;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class UbiAekQConnectionInfo extends URLConnectorInfoImpl
{
  private static final long serialVersionUID = 1L;

  public UbiAekQConnectionInfo()
  {
    super("jdbc:db2://q1assubi:60008/UBIAEKQ2", "ubiusr", "geheim", "com.ibm.db2.jcc.DB2Driver", "KN97", DatabaseType.DB2);
  }
}
