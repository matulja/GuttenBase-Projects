package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
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

		final TdmKaEverythingMapper mapper = new TdmKaEverythingMapper();

		for (final TableMetaData sourceTableMetaData : tableSourceMetaDatas) {
			final List<ColumnMetaData> sourceColumns = sourceTableMetaData.getColumnMetaData();
			final List<ColumnMetaDataBuilder> targetColumns = new ArrayList<ColumnMetaDataBuilder>();

			for (final ColumnMetaData sourceColumnMetaData : sourceColumns) {
				if (mapper.isApplicable(sourceColumnMetaData, sourceColumnMetaData)) {
					final ColumnMetaDataBuilder source = new ColumnMetaDataBuilder(sourceColumnMetaData).setPrimaryKey(false);
					final ColumnMetaDataBuilder target = new ColumnMetaDataBuilder(sourceColumnMetaData).setPrimaryKey(false)
							.setColumnClassName(String.class.getName()).setColumnTypeName("VARCHAR(40)")
							.setColumnName(mapper.mapColumnName(sourceColumnMetaData));

					targetColumns.add(source);
					targetColumns.add(target);
				}
			}

			if (!targetColumns.isEmpty()) {
				final TableMetaDataBuilder tableMetaDataBuilder = new TableMetaDataBuilder().setTableName(mapper.mapTableName(sourceTableMetaData));

				for (final ColumnMetaDataBuilder columnMetaDataBuilder : targetColumns) {
					tableMetaDataBuilder.addColumn(columnMetaDataBuilder);

					tableMetaDataBuilder.addIndex(new IndexMetaDataBuilder().addColumn(columnMetaDataBuilder)
							.setIndexName("IDX_" + columnMetaDataBuilder.getColumnName() + "_" + _indexIndex++).setUnique(true));
				}

				_databaseMetaDataBuilder.addTable(tableMetaDataBuilder);
			}
		}

		return _databaseMetaDataBuilder.setSchema(_targetSchema).build();
	}
}
