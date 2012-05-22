package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.hints.TableColumnFilterHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactory;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactoryHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultTableMapperHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.TableColumnFilter;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
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
			final TdmKaPostgresqlConnectionInfo sourceInfo = new TdmKaPostgresqlConnectionInfo();
			final TdmKaPostgresqlConnectionInfo2 targetInfo = new TdmKaPostgresqlConnectionInfo2();

			connectorRepository.addConnectionInfo(SOURCE, sourceInfo);
			connectorRepository.addConnectionInfo(TARGET, targetInfo);

			connectorRepository.addConnectorHint(SOURCE, new TdmKaSourceTableNameFilterHint());

			// Create insert statements needed later
			final List<String> insertStatements = new TdmKaInsertSelectStatementCreator(connectorRepository, SOURCE, sourceInfo.getSchema(),
					targetInfo.getSchema()).createInsertStatements();

			// Create new "database", i.e. new tables used for migration
			final DatabaseMetaData mappingDatabaseMetaData = new TdmKaMappingTablesCreator(connectorRepository, SOURCE, targetInfo.getSchema())
					.createMappingTablesDatabase();

			// Add new "database"
			connectorRepository.addConnectionInfo(TARGET_NEW_TABLES, new NewTablesConnectionInfo(mappingDatabaseMetaData));

			// Create new tables (for performance reasons indexes will be created later)
			createNewTables(connectorRepository, mappingDatabaseMetaData);

			setupTargetConnector(connectorRepository);

			setupSourceConnector(connectorRepository, mappingDatabaseMetaData);

			new DefaultTableCopier(connectorRepository).copyTables(SOURCE, TARGET_NEW_TABLES);

			createNewTablesIndexes(connectorRepository, mappingDatabaseMetaData);

			new ScriptExecutor(connectorRepository).executeScript(TARGET, insertStatements);

		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}

	private static void createNewTablesIndexes(final ConnectorRepository connectorRepository, final DatabaseMetaData mappingDatabaseMetaData)
			throws SQLException {
		final DatabaseSchemaScriptCreator creator = new DatabaseSchemaScriptCreator();
		new ScriptExecutor(connectorRepository).executeScript(TARGET_NEW_TABLES, creator.createIndexStatements(mappingDatabaseMetaData));
	}

	private static void createNewTables(final ConnectorRepository connectorRepository, final DatabaseMetaData mappingDatabaseMetaData)
			throws SQLException {
		final DatabaseSchemaScriptCreator creator = new DatabaseSchemaScriptCreator();
		new ScriptExecutor(connectorRepository).executeScript(TARGET_NEW_TABLES, creator.createTableStatements(mappingDatabaseMetaData));
	}

	private static void setupSourceConnector(final ConnectorRepository connectorRepository, final DatabaseMetaData mappingDatabaseMetaData) {
		connectorRepository.addConnectorHint(SOURCE, new OnlyTablesWithMappingsTableFilter(mappingDatabaseMetaData));

		connectorRepository.addConnectorHint(SOURCE, new TableColumnFilterHint() {
			private static final long serialVersionUID = 1L;

			@Override
			public TableColumnFilter getValue() {
				return new IdColumnsOnlyColumnFilter();
			}
		});
	}

	private static void setupTargetConnector(final ConnectorRepository connectorRepository) {
		final IdColumnDataMapper columnDataMapper = new IdColumnDataMapper();

		connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultColumnDataMapperFactoryHint() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void addMappings(final DefaultColumnDataMapperFactory columnDataMapperFactory) {
				columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, columnDataMapper);
				columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, columnDataMapper);
			}
		});

		connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultTableMapperHint() {
			private static final long serialVersionUID = 1L;

			@Override
			public TableMapper getValue() {
				return new TdmKaTableMapper();
			}
		});

		connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new DefaultColumnMapperHint() {
			private static final long serialVersionUID = 1L;

			@Override
			public ColumnMapper getValue() {
				return new IdColumnsOnlyColumnFilter();
			}
		});

		connectorRepository.addConnectorHint(TARGET_NEW_TABLES, new TableColumnFilterHint() {
			private static final long serialVersionUID = 1L;

			@Override
			public TableColumnFilter getValue() {
				return new IdColumnsOnlyColumnFilter();
			}
		});
	}
}
