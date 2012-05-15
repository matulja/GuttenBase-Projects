package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfoImpl;

public class AevMySqlConnectionInfo extends URLConnectionInfoImpl {
	private static final long serialVersionUID = 1L;

	public AevMySqlConnectionInfo() {
		super("jdbc:mysql://localhost:3306/aev", "kvbb", "aerzteverzeichnis", "com.mysql.jdbc.Driver", "aev", DatabaseType.MYSQL);
	}
}
