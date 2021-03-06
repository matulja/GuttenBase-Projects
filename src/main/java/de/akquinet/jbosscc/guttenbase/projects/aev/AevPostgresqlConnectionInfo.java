package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class AevPostgresqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public AevPostgresqlConnectionInfo() {
		super("jdbc:postgresql://localhost:5432/aev", "kvbb", "aerzteverzeichnis", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
	}
}
