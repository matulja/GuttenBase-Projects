package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import de.akquinet.jbosscc.guttenbase.configuration.TableNameMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnNameMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;

public final class TdmKaEverythingMapper implements ColumnDataMapper, ColumnNameMapper, TableNameMapper {
	private final Map<String, String> _idMap = new HashMap<String, String>();
	public static final String UUID_PREFIX = "UUID_";

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
	public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData) {
		final String columnName = sourceColumnMetaData.getColumnName().toLowerCase();
		final boolean columnNamesEqual = columnName.equalsIgnoreCase(targetColumnMetaData.getColumnName());

		return columnNamesEqual && (columnName.endsWith("_id") || "id".equals(columnName));
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
	public String mapTableName(final TableMetaData sourceTableMetaData) throws SQLException {
		return UUID_PREFIX + sourceTableMetaData.getTableName();
	}

	@Override
	public String mapColumnName(final ColumnMetaData sourceColumnMetaData) throws SQLException {
		return UUID_PREFIX + sourceColumnMetaData.getColumnName();
	}
}