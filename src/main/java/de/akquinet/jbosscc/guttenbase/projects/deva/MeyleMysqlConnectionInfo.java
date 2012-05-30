package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class MeyleMysqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public MeyleMysqlConnectionInfo() {
		super("jdbc:mysql://localhost:3306/deva", "meyle", "meylenstein", "com.mysql.jdbc.Driver", "deva", DatabaseType.MYSQL);
	}
}
