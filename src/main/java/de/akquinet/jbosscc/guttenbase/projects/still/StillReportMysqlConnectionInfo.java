package de.akquinet.jbosscc.guttenbase.projects.still;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class StillReportMysqlConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public StillReportMysqlConnectionInfo() {
		super("jdbc:mysql://localhost:3306/import", "stillreport", "stillreport", "com.mysql.jdbc.Driver", "import", DatabaseType.MYSQL);
	}
}
