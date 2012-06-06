package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnNameMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.meta.builder.ColumnMetaDataBuilder;
import de.akquinet.jbosscc.guttenbase.meta.builder.DatabaseMetaDataBuilder;
import de.akquinet.jbosscc.guttenbase.meta.builder.IndexMetaDataBuilder;
import de.akquinet.jbosscc.guttenbase.meta.builder.TableMetaDataBuilder;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;

public class TdmKaMappingTablesCreator {
	private final DatabaseMetaDataBuilder _databaseMetaDataBuilder = new DatabaseMetaDataBuilder();
	private final ConnectorRepository _connectorRepository;
	private final String _connectorId;
	private final String _targetSchema;
	private int _indexIndex = 1;

	public TdmKaMappingTablesCreator(final ConnectorRepository connectorRepository, final String connectorId, final String targetSchema) {
		_connectorRepository = connectorRepository;
		_connectorId = connectorId;
		_targetSchema = targetSchema;
	}

	public DatabaseMetaData createMappingTablesDatabase() throws SQLException {
		final List<TableMetaData> tableSourceMetaDatas = TableOrderHint.getSortedTables(_connectorRepository, _connectorId);

		final ColumnNameMapper columnNameMapper = new IdColumnsOnlyColumnFilter();
		final ColumnDataMapper columnDataMapper = new IdColumnDataMapper();
		final TdmKaTableMapper tableMapper = new TdmKaTableMapper();

		for (final TableMetaData sourceTableMetaData : tableSourceMetaDatas) {
			final List<ColumnMetaData> sourceColumns = sourceTableMetaData.getColumnMetaData();
			final List<ColumnMetaDataBuilder> targetColumns = new ArrayList<ColumnMetaDataBuilder>();
			final TableMetaDataBuilder tableMetaDataBuilder = new TableMetaDataBuilder(_databaseMetaDataBuilder).setTableName(tableMapper
					.mapTableName(sourceTableMetaData));

			for (final ColumnMetaData sourceColumnMetaData : sourceColumns) {
				if (columnDataMapper.isApplicable(sourceColumnMetaData, sourceColumnMetaData)) {
					final ColumnMetaDataBuilder source = new ColumnMetaDataBuilder(tableMetaDataBuilder, sourceColumnMetaData).setPrimaryKey(false);
					final ColumnMetaDataBuilder target = new ColumnMetaDataBuilder(tableMetaDataBuilder, sourceColumnMetaData).setPrimaryKey(false)
							.setColumnClassName(String.class.getName()).setColumnTypeName("VARCHAR(40)")
							.setColumnName(columnNameMapper.mapColumnName(sourceColumnMetaData));

					targetColumns.add(source);
					targetColumns.add(target);
				}
			}

			if (!targetColumns.isEmpty()) {
				for (final ColumnMetaDataBuilder columnMetaDataBuilder : targetColumns) {
					tableMetaDataBuilder.addColumn(columnMetaDataBuilder);

					final ColumnMetaData sourceColumnMetaData = sourceTableMetaData.getColumnMetaData(columnMetaDataBuilder.getColumnName());
					final boolean unique = sourceColumnMetaData != null && sourceColumnMetaData.isPrimaryKey()
							&& "id".equalsIgnoreCase(sourceColumnMetaData.getColumnName());

					tableMetaDataBuilder.addIndex(new IndexMetaDataBuilder(tableMetaDataBuilder).addColumn(columnMetaDataBuilder)
							.setIndexName("IDX_" + columnMetaDataBuilder.getColumnName() + "_" + _indexIndex++).setUnique(unique));
				}

				_databaseMetaDataBuilder.addTable(tableMetaDataBuilder);
			}
		}

		return _databaseMetaDataBuilder.setSchema(_targetSchema).build();
	}
}
