package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class MeyleMsSqlConnectionInfo extends URLConnectorInfoImpl
{
  private static final long serialVersionUID = 1L;

  public MeyleMsSqlConnectionInfo()
  {
    super("jdbc:jtds:sqlserver://SQL01-01.gaertner.com/PDP_TEST;instance=INST01", "PDP-DB-User", "pdp4meyle",
            "net.sourceforge.jtds.jdbc.Driver", "dbo", DatabaseType.MSSQL);
  }
}
