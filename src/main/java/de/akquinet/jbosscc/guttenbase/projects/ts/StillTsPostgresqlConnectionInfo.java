package de.akquinet.jbosscc.guttenbase.projects.ts;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class StillTsPostgresqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public StillTsPostgresqlConnectionInfo() {
		super("jdbc:postgresql://localhost:5432/stillts", "tdm", "geheim", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
	}
}
