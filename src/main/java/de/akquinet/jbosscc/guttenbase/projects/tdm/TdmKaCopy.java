package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.connector.Connector;
import de.akquinet.jbosscc.guttenbase.connector.impl.AbstractURLConnector;
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

			connectorRepository.addConnectionInfo(TARGET_NEW_TABLES, new NewTablesConnectionInfo(databaseMetaData));

			final DatabaseSchemaScriptCreator creator = new DatabaseSchemaScriptCreator();
			new ScriptExecutor(connectorRepository).executeScript(TARGET_NEW_TABLES, creator.createStatements(databaseMetaData));

		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}

	private static final class NewTablesConnectionInfo extends TdmKaPostgresqlConnectionInfo2 {
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
}
