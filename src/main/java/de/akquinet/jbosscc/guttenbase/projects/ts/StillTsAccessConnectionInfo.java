package de.akquinet.jbosscc.guttenbase.projects.ts;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class StillTsAccessConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public StillTsAccessConnectionInfo() {
		super("jdbc:odbc:Schilder2000", "", "", "sun.jdbc.odbc.JdbcOdbcDriver", "", DatabaseType.MS_ACCESS);
	}
}
