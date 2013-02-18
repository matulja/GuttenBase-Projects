package de.akquinet.jbosscc.guttenbase.projects.aprico;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class ApricoOracleConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public ApricoOracleConnectionInfo() {
		super("jdbc:oracle:thin:@oracle-test1.unix.bgberlin.com:1521:oratst1", "RTIFOMT1", "RTIFOMT1",
				"oracle.jdbc.OracleDriver", "RTIFOMT1", DatabaseType.ORACLE);
	}
}
