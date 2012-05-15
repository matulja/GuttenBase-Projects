package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfoImpl;

public class MeylePostgresqlConnectionInfo extends URLConnectionInfoImpl {
	private static final long serialVersionUID = 1L;

	public MeylePostgresqlConnectionInfo() {
		super("jdbc:postgresql://localhost:5432/meyle-devA", "meyle", "meylenstein", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
	}
}
