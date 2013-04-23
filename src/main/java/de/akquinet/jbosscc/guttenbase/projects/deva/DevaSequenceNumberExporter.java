package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.tools.MinMaxIdSelectorTool;
import de.akquinet.jbosscc.guttenbase.tools.ReadTableDataTool;

public class DevaSequenceNumberExporter implements ExportDumpExtraInformation {
	public static final List<String> DEVA_SEQUENCETABLES = Arrays.asList("SESSIONINFO_ID_SEQ", "WORKITEMINFO_ID_SEQ",
	    "hibernate_sequence");

	@Override
	public Map<String, Serializable> getExtraInformation(final ConnectorRepository connectorRepository, final String connectorId,
	    final ExportDumpConnectorInfo exportDumpConnectionInfo) throws SQLException {
		final Map<String, Serializable> result = new HashMap<String, Serializable>();
		final ReadTableDataTool readTableDataTool = new ReadTableDataTool(connectorRepository);
		final DatabaseMetaData databaseMetaData = connectorRepository.getDatabaseMetaData(MeyleExportDeva.MEYLE_MS_SQL);

		for (final String tableName : DEVA_SEQUENCETABLES) {
			final List<Map<String, Object>> tableData = readTableDataTool.readTableData(MeyleExportDeva.MEYLE_MS_SQL,
			    databaseMetaData.getTableMetaData(tableName), 1);

			final Long data = (Long) tableData.get(0).get("next_val");

			MeyleExportDeva.LOG.info("Sequence number for " + tableName + " is " + data);
			result.put(tableName, data);
		}

		final MinMaxIdSelectorTool maxIdSelectorTool = new MinMaxIdSelectorTool(connectorRepository);
		final List<TableMetaData> tableMetaData = databaseMetaData.getTableMetaData();

		for (final TableMetaData table : tableMetaData) {
			final String tableName = table.getTableName();

			if (tableName.toUpperCase().startsWith("DEVA_")) {
				maxIdSelectorTool.computeMinMax(MeyleExportDeva.MEYLE_MS_SQL, table);
				final Long data = maxIdSelectorTool.getMaxValue() + 1;
				MeyleExportDeva.LOG.info("Sequence number for " + tableName + " is " + data);
				result.put(tableName.toLowerCase() + "_id_seq", data);
			}
		}

		return result;
	}
}