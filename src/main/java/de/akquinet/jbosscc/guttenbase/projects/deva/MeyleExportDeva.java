package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.ExportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ReadTableDataTool;

public class MeyleExportDeva {
	private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

	private static final String MEYLE_EXPORT = "meyleExport";
	private static final String MEYLE_MS_SQL = "meyleMsSql";

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			final List<String> sequenceTables = Arrays.asList("SESSIONINFO_ID_SEQ", "WORKITEMINFO_ID_SEQ", "hibernate_sequence");

			connectorRepository.addConnectionInfo(MEYLE_MS_SQL, new MeyleMsSqlConnectionInfo());
			connectorRepository.addConnectionInfo(MEYLE_EXPORT, new ExportDumpConnectorInfo(MEYLE_MS_SQL, "deva.jar"));

			connectorRepository.addConnectorHint(MEYLE_EXPORT, new ExportDumpExtraInformationHint() {
				@Override
				public ExportDumpExtraInformation getValue() {
					return new ExportDumpExtraInformation() {
						@Override
						public Map<String, Serializable> getExtraInformation(final ConnectorRepository connectorRepository, final String connectorId,
								final ExportDumpConnectorInfo exportDumpConnectionInfo) throws SQLException {
							final Map<String, Serializable> result = new HashMap<String, Serializable>();
							final ReadTableDataTool readTableDataTool = new ReadTableDataTool(connectorRepository);
							final DatabaseMetaData databaseMetaData = connectorRepository.getDatabaseMetaData(MEYLE_MS_SQL);

							for (final String tableName : sequenceTables) {
								final List<Map<String, Object>> tableData = readTableDataTool.readTableData(MEYLE_MS_SQL,
										databaseMetaData.getTableMetaData(tableName), 1);

								final Long data = (Long) tableData.get(0).get("next_val");
								result.put(tableName, data);
							}
							return result;
						}
					};
				}
			});

			new DefaultTableCopyTool(connectorRepository).copyTables(MEYLE_MS_SQL, MEYLE_EXPORT);
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
