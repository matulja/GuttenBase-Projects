package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;

public final class IdColumnMapper implements ColumnDataMapper {
	private final Map<String, String> _idMap = new HashMap<String, String>();

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
}