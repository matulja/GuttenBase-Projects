package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import de.akquinet.jbosscc.guttenbase.configuration.TableNameMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnNameMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.TableColumnFilter;

public final class TdmKaEverythingMapper implements ColumnMapper, ColumnDataMapper, ColumnNameMapper, TableNameMapper, TableMapper,
		TableColumnFilter {
	private final Map<String, String> _idMap = new HashMap<String, String>();
	public static final String UUID_PREFIX = "UUID_";
	public static final String UUID_SUFFIX = "_UUID";

	@Override
	public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData, final Object value) {
		final Number number = (Number) value;

		if (number != null) {
			final long id = number.longValue();
			final ColumnMetaData referencedColumn = sourceColumnMetaData.getReferencedColumn();
			String uuid;

			if (referencedColumn != null) {
				uuid = createKey(referencedColumn, id);
			} else {
				uuid = createKey(sourceColumnMetaData, id);
			}

			return uuid;
		} else {
			return null;
		}
	}

	@Override
	public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData) throws SQLException {
		final String sourceColumnName = sourceColumnMetaData.getColumnName().toUpperCase();
		final String targetColumnName = targetColumnMetaData.getColumnName().toUpperCase();

		return (sourceColumnName.equalsIgnoreCase(targetColumnName) || targetColumnName.equalsIgnoreCase(mapColumnName(sourceColumnMetaData)))
				&& accept(sourceColumnMetaData);
	}

	private String createKey(final ColumnMetaData columnMetaData, final long id) {
		final String key = columnMetaData.getTableMetaData().getTableName() + ":" + columnMetaData.getColumnName() + ":" + id;
		String newId = _idMap.get(key);

		if (newId == null) {
			newId = UUID.randomUUID().toString();
			_idMap.put(key, newId);
		}

		return newId;
	}

	@Override
	public String mapTableName(final TableMetaData sourceTableMetaData) {
		return UUID_PREFIX + sourceTableMetaData.getTableName();
	}

	@Override
	public String mapColumnName(final ColumnMetaData sourceColumnMetaData) {
		return sourceColumnMetaData.getColumnName() + UUID_SUFFIX;
	}

	@Override
	public TableMetaData map(final TableMetaData source, final DatabaseMetaData targetDatabaseMetaData) {
		final String mappedTableName = mapTableName(source);
		return targetDatabaseMetaData.getTableMetaData(mappedTableName);
	}

	@Override
	public boolean accept(final ColumnMetaData column) {
		final String columnName = column.getColumnName().toUpperCase();
		return (columnName.endsWith("_ID") || "ID".equals(columnName) || columnName.endsWith("_ID" + UUID_SUFFIX) || ("ID" + UUID_SUFFIX)
				.equals(columnName));
	}

	@Override
	public List<ColumnMetaData> map(final ColumnMetaData source, final TableMetaData targetTableMetaData) throws SQLException {
		final String columnName = source.getColumnName();
		final ColumnMetaData columnMetaData1 = targetTableMetaData.getColumnMetaData(columnName);
		final ColumnMetaData columnMetaData2 = targetTableMetaData.getColumnMetaData(mapColumnName(source));

		return Arrays.asList(columnMetaData1, columnMetaData2);
	}
}