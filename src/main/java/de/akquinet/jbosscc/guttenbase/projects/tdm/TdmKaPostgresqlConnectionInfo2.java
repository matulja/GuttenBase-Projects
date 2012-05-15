package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class TdmKaPostgresqlConnectionInfo2 extends URLConnectionInfo {
	private static final long serialVersionUID = 1L;

	public TdmKaPostgresqlConnectionInfo2() {
		super("jdbc:postgresql://localhost:5432/tdmka", "tdm", "geheim", "org.postgresql.Driver", "private", DatabaseType.POSTGRESQL);
	}
}
