package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.connector.Connector;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.AbstractURLConnector;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutor;
import de.akquinet.jbosscc.guttenbase.utils.DatabaseSchemaScriptCreator;

public class TdmKaCopy {

	private static final String SOURCE = "SOURCE";
	private static final String TARGET = "TARGET";
	private static final String TARGET_NEW_TABLES = "TARGET_NEW_TABLES";
	private static final Logger LOG = Logger.getLogger(TdmKaCopy.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			final TdmKaPostgresqlConnectionInfo2 targetInfo = new TdmKaPostgresqlConnectionInfo2();

			connectorRepository.addConnectionInfo(SOURCE, new TdmKaPostgresqlConnectionInfo());
			connectorRepository.addConnectionInfo(TARGET, targetInfo);

			connectorRepository.addConnectorHint(SOURCE, new TdmKaTableNameFilterHint());

			final DatabaseMetaData databaseMetaData = new TdmKaMappingTablesCreator(connectorRepository, SOURCE, targetInfo.getSchema())
					.createMappingTablesDatabase();

			connectorRepository.addConnectionInfo(TARGET_NEW_TABLES, new NewTablesConnectionInfo(databaseMetaData, targetInfo));

			final DatabaseSchemaScriptCreator creator = new DatabaseSchemaScriptCreator();
			new ScriptExecutor(connectorRepository).executeScript(TARGET, creator.createStatements(databaseMetaData));

		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}

	private static final class NewTablesConnectionInfo implements URLConnectionInfo {
		private final URLConnectionInfo _targetInfo;
		private static final long serialVersionUID = 1L;
		private final DatabaseMetaData _databaseMetaData;

		private NewTablesConnectionInfo(final DatabaseMetaData databaseMetaData, final URLConnectionInfo targetInfo) {
			_databaseMetaData = databaseMetaData;
			_targetInfo = targetInfo;
		}

		@Override
		public String getUser() {
			return _targetInfo.getUser();
		}

		@Override
		public String getSchema() {
			return _targetInfo.getSchema();
		}

		@Override
		public String getPassword() {
			return _targetInfo.getPassword();
		}

		@Override
		public DatabaseType getDatabaseType() {
			return _targetInfo.getDatabaseType();
		}

		@Override
		public String getUrl() {
			return _targetInfo.getUrl();
		}

		@Override
		public String getDriver() {
			return _targetInfo.getDriver();
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
}
