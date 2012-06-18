package de.akquinet.jbosscc.guttenbase.projects.kommportal;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class KommportalOracleConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public KommportalOracleConnectionInfo() {
		super("jdbc:oracle:thin:mbo/mbo@db.spree.de:1521:fg", "mbo", "mbo", "oracle.jdbc.driver.OracleDriver", "mbo", DatabaseType.ORACLE);
	}
}
