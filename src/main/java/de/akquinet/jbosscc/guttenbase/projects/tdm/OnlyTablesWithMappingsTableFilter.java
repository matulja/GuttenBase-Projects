package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

public final class OnlyTablesWithMappingsTableFilter extends RepositoryTableFilterHint {
	private final DatabaseMetaData _mappingDatabaseMetaData;

	public OnlyTablesWithMappingsTableFilter(final DatabaseMetaData mappingDatabaseMetaData) {
		_mappingDatabaseMetaData = mappingDatabaseMetaData;
	}

	@Override
	public RepositoryTableFilter getValue() {
		return new RepositoryTableFilter() {
			@Override
			public boolean accept(final TableMetaData table) throws SQLException {
				final TableMetaData tableMetaData = new TdmKaTableMapper().map(table, _mappingDatabaseMetaData);

				return tableMetaData != null;
			}
		};
	}
}