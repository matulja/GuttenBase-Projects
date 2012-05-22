package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.UUID;

import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;

public class IdColumnDataMapper implements ColumnDataMapper {
	// private final Map<String, String> _idMap = new HashMap<String, String>();

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
		final IdColumnsOnlyColumnFilter columnFilter = new IdColumnsOnlyColumnFilter();
		return (sourceColumnName.equalsIgnoreCase(targetColumnName) || targetColumnName.equalsIgnoreCase(columnFilter
				.mapColumnName(sourceColumnMetaData))) && columnFilter.accept(sourceColumnMetaData);
	}

	private String createKey(final ColumnMetaData columnMetaData, final long id) {
		final String key = columnMetaData.getTableMetaData().getTableName() + ":" + columnMetaData.getColumnName();

		final UUID uuid = new UUID(key.hashCode(), id);

		return uuid.toString();
		// String newId = _idMap.get(key);
		//
		// if (newId == null) {
		// newId = UUID.randomUUID().toString();
		// _idMap.put(key, newId);
		// }
		//
		// return newId;
	}
}
