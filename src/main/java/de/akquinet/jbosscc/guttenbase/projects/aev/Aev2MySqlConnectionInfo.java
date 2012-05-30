package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class Aev2MySqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public Aev2MySqlConnectionInfo() {
		super("jdbc:mysql://localhost:3306/aev2", "kvbb", "aerzteverzeichnis", "com.mysql.jdbc.Driver", "aev2", DatabaseType.MYSQL);
	}
}
