package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfoImpl;

public class AevPostgresqlConnectionInfo extends URLConnectionInfoImpl {
	private static final long serialVersionUID = 1L;

	public AevPostgresqlConnectionInfo() {
		super("jdbc:postgresql://localhost:5432/aev", "kvbb", "aerzteverzeichnis", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
	}
}
