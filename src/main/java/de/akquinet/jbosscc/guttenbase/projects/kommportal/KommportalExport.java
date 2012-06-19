package de.akquinet.jbosscc.guttenbase.projects.kommportal;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.hints.NumberOfRowsPerInsertionHint;
import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.NumberOfRowsPerInsertion;

public class KommportalExport {
	private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

	private static final String EXPORT = "export";
	private static final String SOURCE = "oracle";

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new KommportalOracleConnectionInfo());
			connectorRepository.addConnectionInfo(EXPORT, new ExportDumpConnectorInfo(SOURCE, "kommportal.jar"));

			final RepositoryTableFilterHint filterHint = new RepositoryTableFilterHint() {
				@Override
				public RepositoryTableFilter getValue() {
					return new RepositoryTableFilter() {
						@Override
						public boolean accept(final TableMetaData table) throws SQLException {
							final String tableName = table.getTableName().toUpperCase();
							return /* tableName.compareTo("PLAN_TABLE") >= 0 && */!tableName.contains("$");
						}
					};
				}
			};
			connectorRepository.addConnectorHint(SOURCE, filterHint);

			connectorRepository.addConnectorHint(SOURCE, new NumberOfRowsPerInsertionHint() {
				@Override
				public NumberOfRowsPerInsertion getValue() {
					return new NumberOfRowsPerInsertion() {
						@Override
						public boolean useValuesClauses(final TableMetaData targetTableMetaData) {
							return true;
						}

						@Override
						public int getNumberOfRowsPerInsertion(final TableMetaData targetTableMetaData) {
							if ("ANYBINARY".equalsIgnoreCase(targetTableMetaData.getTableName())) {
								return 1;
							} else {
								return 2000;
							}
						}
					};
				}
			});

			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, EXPORT);
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
