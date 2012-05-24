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

			connectorRepository.addConnectorHint(SOURCE, new TableNameMapperHint() {
				@Override
				public TableNameMapper getValue() {
					return new TableNameMapper() {
						@Override
						public String mapTableName(final TableMetaData tableMetaData) throws SQLException {
							return "`" + tableMetaData.getTableName() + "`";
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
