package de.akquinet.jbosscc.guttenbase.projects.still;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class StillReportMysqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public StillReportMysqlConnectionInfo() {
		super("jdbc:mysql://127.0.0.1:3307/import", "stillreport", "stillreport", "com.mysql.jdbc.Driver", "", DatabaseType.MYSQL);
	}
}
