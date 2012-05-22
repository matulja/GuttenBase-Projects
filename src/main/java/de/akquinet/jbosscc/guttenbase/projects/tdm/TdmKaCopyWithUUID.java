package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactory;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactoryHint;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

public class TdmKaCopyWithUUID {
	private static final String TARGET = "TARGET";
	private static final String EXPORT = "DUMP";
	private static final String IMPORT = "IMPORT";
	private static final String SOURCE = "SOURCE";
	private static final Logger LOG = Logger.getLogger(TdmKaCopyWithUUID.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new TdmKaPostgresqlConnectionInfo());
			connectorRepository.addConnectionInfo(TARGET, new TdmKaPostgresqlConnectionInfo2());
			// connectorRepository.addConnectionInfo(EXPORT, new ExportDumpConnectionInfo(SOURCE, "tdmka.jar"));
			connectorRepository.addConnectionInfo(IMPORT, new ImportDumpConnectionInfo("tdmka.jar"));

			connectorRepository.addConnectorHint(SOURCE, new TdmKaSourceTableNameFilterHint());
			connectorRepository.addConnectorHint(IMPORT, new TdmKaSourceTableNameFilterHint());
			final IdColumnDataMapper columnDataMapper = new IdColumnDataMapper();

			connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperFactoryHint() {
				private static final long serialVersionUID = 1L;

				@Override
				protected void addMappings(final DefaultColumnDataMapperFactory columnDataMapperFactory) {
					columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, columnDataMapper);
					columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, columnDataMapper);
				}
			});

			// new PostgresqlReindexTablesTool(connectorRepository).executeOnAllTables(SOURCE);
			// new PostgresqlVacuumTablesTool(connectorRepository).executeOnAllTables(SOURCE);

			// new TableConfigurationChecker(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
			// new PostgresqlVacuumTablesTool(connectorRepository).executeOnAllTables(TARGET);
			// new DefaultTableCopier(connectorRepository).copyTables(SOURCE, DUMP);
			new DefaultTableCopier(connectorRepository).copyTables(IMPORT, TARGET);
			// new TableDataChecker(connectorRepository).checkTableData(SOURCE, TARGET);

			// new PostgresqlReindexTablesTool(connectorRepository).executeOnAllTables(TARGET);
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
