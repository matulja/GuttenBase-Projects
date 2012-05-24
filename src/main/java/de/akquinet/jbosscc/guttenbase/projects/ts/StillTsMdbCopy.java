package de.akquinet.jbosscc.guttenbase.projects.ts;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.configuration.TableNameMapper;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.TableNameMapperHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

public class StillTsMdbCopy {
	private static final String SOURCE = "SOURCE";
	private static final String DUMP = "DUMP";

	private static final Logger LOG = Logger.getLogger(StillTsMdbCopy.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			connectorRepository.addConnectionInfo(SOURCE, new StillTsAccessConnectionInfo());
			connectorRepository.addConnectionInfo(DUMP, new ExportDumpConnectionInfo(SOURCE, "stillts.jar"));

			// 17:59:22,903 INFO [AbstractTableCopier] 26 lines copied, average per batch (2000) = 00:00:00
			// T=84, r=114, a=97, g=103, f=102, õ=228(245), h=104, i=105, g=103, k=107, e=101, i=105, t=116, s=115, s=115, c=99, h=104, i=105,
			// l=108,
			// d=100, e=101, r=114,
			// 17:59:22,905 INFO [AbstractTableCopier] Copying of `Tragfõhigkeitsschilder`-> Tragfõhigkeitsschilder(36/39) started

			connectorRepository.addConnectorHint(SOURCE, new TableNameMapperHint() {
				@Override
				public TableNameMapper getValue() {
					return new TableNameMapper() {
						@Override
						public String mapTableName(final TableMetaData tableMetaData) throws SQLException {
							final String tableName = tableMetaData.getTableName();

							// for (int i = 0; i < tableName.length(); i++) {
							// final char ch = tableName.charAt(i);
							// System.out.print(String.valueOf(ch) + "=" + String.valueOf((int) ch) + ", ");
							// }
							// System.out.println();

							return "`" + tableName + "`";
						}
					};
				}
			});

			// connectorRepository.addConnectorHint(TARGET, new TableMapperHint() {
			// @Override
			// public TableMapper getValue() {
			// return new TableMapper() {
			// @Override
			// public TableMetaData map(final TableMetaData source, final DatabaseMetaData targetDatabaseMetaData) throws SQLException {
			// final String tableName = source.getTableName();
			//
			// final String targetTableName = tableName
			// // TODO Auto-generated method stub
			// return null;
			// }
			// };
			// }
			// });

			new DefaultTableCopier(connectorRepository).copyTables(SOURCE, DUMP);
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
