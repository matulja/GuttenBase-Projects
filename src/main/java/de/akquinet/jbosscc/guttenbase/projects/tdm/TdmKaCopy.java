package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.connector.Connector;
import de.akquinet.jbosscc.guttenbase.connector.impl.AbstractURLConnector;
import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.hints.TableColumnFilterHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactory;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactoryHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultTableMapperHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;
import de.akquinet.jbosscc.guttenbase.repository.TableColumnFilter;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

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
			// connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo("tdmka.jar"));

			connectorRepository.addConnectionInfo(TARGET, targetInfo);

			connectorRepository.addConnectorHint(SOURCE, new TdmKaTableNameFilterHint());

			final DatabaseMetaData mappingDatabaseMetaData = new TdmKaMappingTablesCreator(connectorRepository, SOURCE, targetInfo.getSchema())
					.createMappingTablesDatabase();

			connectorRepository.addConnectionInfo(TARGET_NEW_TABLES, new NewTablesConnectionInfo(mappingDatabaseMetaData));

			// final DatabaseSchemaScriptCreator creator = new DatabaseSchemaScriptCreator();
			// new ScriptExecutor(connectorRepository).executeScript(TARGET_NEW_TABLES, creator.createStatements(mappingDatabaseMetaData));

			connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultColumnDataMapperFactoryHint() {
				private static final long serialVersionUID = 1L;
				private final TdmKaEverythingMapper _columnDataMapper = new TdmKaEverythingMapper();

				@Override
				protected void addMappings(final DefaultColumnDataMapperFactory columnDataMapperFactory) {
					columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, _columnDataMapper);
					columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, _columnDataMapper);
				}
			});

			// connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultColumnNameMapperHint() {
			// private static final long serialVersionUID = 1L;
			//
			// @Override
			// public ColumnNameMapper getValue() {
			// return new TdmKaEverythingMapper();
			// }
			// });

			connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultTableMapperHint() {
				private static final long serialVersionUID = 1L;

				@Override
				public TableMapper getValue() {
					return new TdmKaEverythingMapper();
				}
			});

			connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultColumnMapperHint() {
				private static final long serialVersionUID = 1L;

				@Override
				public ColumnMapper getValue() {
					return new TdmKaEverythingMapper();
				}
			});

			connectorRepository.addConnectorHint(SOURCE, new DatabaseTableFilterHint() {
				private static final long serialVersionUID = 1L;

				@Override
				public DatabaseTableFilter getValue() {
					return new DatabaseTableFilter() {
						@Override
						public boolean accept(final TableMetaData table) throws SQLException {
							final TableMetaData tableMetaData = new TdmKaEverythingMapper().map(table, mappingDatabaseMetaData);

							return tableMetaData != null;
						}
					};
				}
			});

			connectorRepository.addConnectorHint(SOURCE, new TableColumnFilterHint() {
				private static final long serialVersionUID = 1L;

				@Override
				public TableColumnFilter getValue() {
					return new TdmKaEverythingMapper();
				}
			});

			connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new TableColumnFilterHint() {
				private static final long serialVersionUID = 1L;

				@Override
				public TableColumnFilter getValue() {
					return new TdmKaEverythingMapper();
				}
			});

			new DefaultTableCopier(connectorRepository).copyTables(SOURCE, TARGET_NEW_TABLES);
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
