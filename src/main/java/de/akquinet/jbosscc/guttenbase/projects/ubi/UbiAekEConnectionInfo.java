package de.akquinet.jbosscc.guttenbase.projects.ubi;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class UbiAekEConnectionInfo extends URLConnectorInfoImpl
{
  private static final long serialVersionUID = 1L;

  public UbiAekEConnectionInfo()
  {
    super("jdbc:db2://e2assubi:50001/UBIAEKDB", "ubiusr", "ubi01", "com.ibm.db2.jcc.DB2Driver", "MCD", DatabaseType.DB2);
  }
}
