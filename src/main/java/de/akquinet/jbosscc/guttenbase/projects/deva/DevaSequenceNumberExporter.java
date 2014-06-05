package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.tools.EntityTableChecker;
import de.akquinet.jbosscc.guttenbase.tools.MinMaxIdSelectorTool;
import de.akquinet.jbosscc.guttenbase.tools.ReadTableDataTool;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DevaSequenceNumberExporter implements ExportDumpExtraInformation
{
  public static final List<String> DEVA_SEQUENCETABLES = Arrays.asList("SESSIONINFO_ID_SEQ", "WORKITEMINFO_ID_SEQ",
          "hibernate_sequence");

  @Override
  public Map<String, Serializable> getExtraInformation(final ConnectorRepository connectorRepository, final String connectorId,
                                                       final ExportDumpConnectorInfo exportDumpConnectionInfo) throws SQLException
  {
    final Map<String, Serializable> result = new HashMap<String, Serializable>();
    readValuesFromSequenceNumberTables(connectorRepository, MeyleExportDeva.MEYLE_MS_SQL, result);
    readValuesFromEntityTables(connectorRepository, MeyleExportDeva.MEYLE_MS_SQL, result);
    return result;
  }

  private void readValuesFromSequenceNumberTables(final ConnectorRepository connectorRepository, String sourceConnectorId, final Map<String, Serializable> result) throws SQLException
  {
    final ReadTableDataTool readTableDataTool = new ReadTableDataTool(connectorRepository);
    final DatabaseMetaData databaseMetaData = connectorRepository.getDatabaseMetaData(sourceConnectorId);

    for (final String tableName : DEVA_SEQUENCETABLES)
    {
      final List<Map<String, Object>> tableData = readTableDataTool.readTableData(sourceConnectorId,
              databaseMetaData.getTableMetaData(tableName), 1);

      final Long data = (Long) tableData.get(0).get("next_val");

      MeyleExportDeva.LOG.info("Next sequence number for " + tableName + " is " + data);
      result.put(tableName, data);
    }
  }

  private void readValuesFromEntityTables(final ConnectorRepository connectorRepository, String sourceConnectorId, final Map<String, Serializable> result) throws SQLException
  {
    final List<TableMetaData> tableMetaDatas = TableOrderHint.getSortedTables(connectorRepository, sourceConnectorId);
    final EntityTableChecker entityTableChecker = connectorRepository.getConnectorHint(sourceConnectorId, EntityTableChecker.class).getValue();
    final MinMaxIdSelectorTool minMaxIdSelector = new MinMaxIdSelectorTool(connectorRepository);

    for (final TableMetaData tableMetaData : tableMetaDatas)
    {
      if (entityTableChecker.isEntityTable(tableMetaData))
      {
        minMaxIdSelector.computeMinMax(sourceConnectorId, tableMetaData);
        final long sequenceValue = minMaxIdSelector.getMaxValue() + 1;
        final String tableName = tableMetaData.getTableName();

        result.put(tableName, sequenceValue);
      }
    }
  }
}
