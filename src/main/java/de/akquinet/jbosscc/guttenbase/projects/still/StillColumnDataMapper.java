package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;

public class StillColumnDataMapper implements ColumnDataMapper {

	@Override
	public boolean isApplicable(ColumnMetaData sourceColumnMetaData,
			ColumnMetaData targetColumnMetaData) throws SQLException {
		String columnName = sourceColumnMetaData.getColumnName();
		return columnName.equalsIgnoreCase("TEXTTECH")
				|| columnName.equalsIgnoreCase("TEXTINT");
	}

	@Override
	public Object map(ColumnMetaData sourceColumnMetaData,
			ColumnMetaData targetColumnMetaData, Object value)
			throws SQLException {
		String result = cleanStrings((String) value);

		System.out.println("map: " + value + "->" + result);
		return result;
	}

	private String cleanStrings(String toClean) {
		if (toClean == null) {
			return "";
		}

		String cleaned = toClean;
		cleaned = cleaned.replace("'", "");
		cleaned = cleaned.replace("\"", "");
		cleaned = cleaned.replace("\\", "");
		cleaned = cleaned.replaceAll("\\p{C}", "");
		cleaned = cleaned.replaceAll("(?m)^[ \t]*\r?\n", " ");
		cleaned = cleaned.replaceAll("\\s{2,}", " ");
		return cleaned;
	}
}
