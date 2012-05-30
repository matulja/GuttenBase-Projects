package de.akquinet.jbosscc.guttenbase.projects.still;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class StillReportPostgresqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public StillReportPostgresqlConnectionInfo() {
		super("jdbc:postgresql://localhost:5432/stillreport_import", "stillreport", "stillreport", "org.postgresql.Driver", "public",
				DatabaseType.POSTGRESQL);
	}
}
