package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnNameMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.TableColumnFilter;

public class IdColumnsOnlyColumnFilter implements TableColumnFilter, ColumnNameMapper, ColumnMapper {
	public static final String UUID_SUFFIX = "_UUID";

	@Override
	public boolean accept(final ColumnMetaData column) {
		final String columnName = column.getColumnName().toUpperCase();
		return (columnName.endsWith("_ID") || "ID".equals(columnName) || columnName.endsWith("_ID" + UUID_SUFFIX) || ("ID" + UUID_SUFFIX)
				.equals(columnName));
	}

	@Override
	public String mapColumnName(final ColumnMetaData sourceColumnMetaData) {
		return sourceColumnMetaData.getColumnName() + UUID_SUFFIX;
	}

	@Override
	public List<ColumnMetaData> map(final ColumnMetaData source, final TableMetaData targetTableMetaData) throws SQLException {
		final String columnName = source.getColumnName();

		final ColumnMetaData columnMetaData1 = targetTableMetaData.getColumnMetaData(columnName);
		final ColumnMetaData columnMetaData2 = targetTableMetaData.getColumnMetaData(mapColumnName(source));

		return Arrays.asList(columnMetaData1, columnMetaData2);
	}
}
