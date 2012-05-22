package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnNameMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;

public class TdmKaInsertSelectStatementCreator {
	private final ConnectorRepository _connectorRepository;
	private final String _connectorId;
	private final String _targetSchema;
	private final String _sourceSchema;

	public TdmKaInsertSelectStatementCreator(final ConnectorRepository connectorRepository, final String connectorId,
			final String sourceSchema, final String targetSchema) {
		_connectorRepository = connectorRepository;
		_connectorId = connectorId;
		_sourceSchema = sourceSchema;
		_targetSchema = targetSchema;
	}

	public List<String> createInsertStatements() throws SQLException {
		final List<TableMetaData> tableSourceMetaDatas = TableOrderHint.getSortedTables(_connectorRepository, _connectorId);
		final List<String> result = new ArrayList<String>();

		final ColumnNameMapper columnNameMapper = new IdColumnsOnlyColumnFilter();
		final ColumnDataMapper columnDataMapper = new IdColumnDataMapper();
		final TdmKaTableMapper tableMapper = new TdmKaTableMapper();

		for (final TableMetaData sourceTableMetaData : tableSourceMetaDatas) {
			final StringBuilder builder = new StringBuilder("INSERT INTO " + _targetSchema + "." + sourceTableMetaData.getTableName()
					+ " SELECT\n");

			final List<ColumnMetaData> sourceColumns = sourceTableMetaData.getColumnMetaData();

			for (final ColumnMetaData sourceColumnMetaData : sourceColumns) {
				if (columnDataMapper.isApplicable(sourceColumnMetaData, sourceColumnMetaData)) {
					builder.append("  u." + columnNameMapper.mapColumnName(sourceColumnMetaData));
				} else {
					builder.append("  t." + sourceColumnMetaData.getColumnName());
				}

				builder.append(",\n");
			}

			builder.setLength(builder.length() - 2);

			builder.append("\nFROM " + _sourceSchema + "." + sourceTableMetaData.getTableName() + " t INNER JOIN " + _targetSchema + "."
					+ tableMapper.mapTableName(sourceTableMetaData) + " u ON ");

			final List<ColumnMetaData> primaryKeyColumns = sourceTableMetaData.getPrimaryKeyColumns();

			for (final ColumnMetaData primaryKey : primaryKeyColumns) {
				builder.append("t." + primaryKey.getColumnName() + " = u." + primaryKey.getColumnName() + "\nAND ");
			}

			builder.setLength(builder.length() - 5);

			builder.append(";\n");

			result.add(builder.toString());
		}

		return result;
	}
}
