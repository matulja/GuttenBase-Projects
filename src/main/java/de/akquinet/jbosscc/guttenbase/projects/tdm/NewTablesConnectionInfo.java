package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.connector.Connector;
import de.akquinet.jbosscc.guttenbase.connector.impl.AbstractURLConnector;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;

public final class NewTablesConnectionInfo extends TdmKaPostgresqlConnectionInfo2 {
	private static final long serialVersionUID = 1L;
	private final DatabaseMetaData _databaseMetaData;

	public NewTablesConnectionInfo(final DatabaseMetaData databaseMetaData) {
		_databaseMetaData = databaseMetaData;
	}

	@Override
	public Connector createConnector(final ConnectorRepository connectorRepository, final String connectorId) {
		return new AbstractURLConnector(connectorRepository, connectorId, this) {
			@Override
			public DatabaseMetaData retrieveDatabaseMetaData() throws SQLException {
				return _databaseMetaData;
			}
		};
	}
}