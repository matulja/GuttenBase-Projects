package de.akquinet.jbosscc.guttenbase.projects.kommportal;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;

public class MeyleOracleConnectionInfo extends URLConnectorInfoImpl {
	private static final long serialVersionUID = 1L;

	public MeyleOracleConnectionInfo() {
		super("jdbc:oracle:thin:mdahm/mdahm@db.spree.de:1521:fg", "mdahm", "mdahm", "oracle.jdbc.driver.OracleDriver", "mdahm",
				DatabaseType.ORACLE);
	}
}
