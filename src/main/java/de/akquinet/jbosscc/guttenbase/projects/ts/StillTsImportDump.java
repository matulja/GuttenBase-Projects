package de.akquinet.jbosscc.guttenbase.projects.ts;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.TableMapperHint;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

public class StillTsImportDump {
	private static final String IMPORT = "IMPORT";
	private static final String TARGET = "TARGET";

	private static final Logger LOG = Logger.getLogger(StillTsImportDump.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			connectorRepository.addConnectionInfo(IMPORT, new ImportDumpConnectionInfo("stillts.jar"));
			connectorRepository.addConnectionInfo(TARGET, new StillTsPostgresqlConnectionInfo());

			// 17:59:22,903 INFO [AbstractTableCopier] 26 lines copied, average per batch (2000) = 00:00:00
			// T=84, r=114, a=97, g=103, f=102, õ=228(245), h=104, i=105, g=103, k=107, e=101, i=105, t=116, s=115, s=115, c=99, h=104, i=105,
			// l=108,
			// d=100, e=101, r=114,
			// 17:59:22,905 INFO [AbstractTableCopier] Copying of `Tragfõhigkeitsschilder`-> Tragfõhigkeitsschilder(36/39) started

			connectorRepository.addConnectorHint(TARGET, new TableMapperHint() {
				@Override
				public TableMapper getValue() {
					return new TableMapper() {
						@Override
						public TableMetaData map(final TableMetaData source, final DatabaseMetaData targetDatabaseMetaData) throws SQLException {
							final String tableName = source.getTableName();
							final String targetTableName = tableName.replaceAll(" ", "_").replaceAll("\\(", "_").replaceAll("\\)", "_")
									.replaceAll("ä", "ae");

							return targetDatabaseMetaData.getTableMetaData(targetTableName);
						}
					};
				}
			});

			new DefaultTableCopier(connectorRepository).copyTables(IMPORT, TARGET);
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
