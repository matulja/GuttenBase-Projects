package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.configuration.TableNameMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;

public final class TdmKaTableMapper implements TableNameMapper, TableMapper {
	public static final String UUID_PREFIX = "UUID_";

	@Override
	public String mapTableName(final TableMetaData sourceTableMetaData) {
		return UUID_PREFIX + sourceTableMetaData.getTableName();
	}

	@Override
	public TableMetaData map(final TableMetaData source, final DatabaseMetaData targetDatabaseMetaData) {
		final String mappedTableName = mapTableName(source);
		return targetDatabaseMetaData.getTableMetaData(mappedTableName);
	}
}