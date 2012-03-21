package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class MeyleMsSqlConnectionInfo extends URLConnectionInfo {
  private static final long serialVersionUID = 1L;

  public MeyleMsSqlConnectionInfo() {
    super("jdbc:jtds:sqlserver://sap01.gaertner.com/PDP_TEST;instance=ittools", "PDP-DB-User", "pdp4meyle",
        "net.sourceforge.jtds.jdbc.Driver", "dbo", DatabaseType.MSSQL);
  }
}
