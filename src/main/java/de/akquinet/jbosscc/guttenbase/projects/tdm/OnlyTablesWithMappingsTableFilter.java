package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;

public final class OnlyTablesWithMappingsTableFilter extends DatabaseTableFilterHint {
	private final TdmKaTableMapper _tdmKaEverythingMapper;
	private final DatabaseMetaData _mappingDatabaseMetaData;
	private static final long serialVersionUID = 1L;

	public OnlyTablesWithMappingsTableFilter(final TdmKaTableMapper tdmKaEverythingMapper, final DatabaseMetaData mappingDatabaseMetaData) {
		_tdmKaEverythingMapper = tdmKaEverythingMapper;
		_mappingDatabaseMetaData = mappingDatabaseMetaData;
	}

	@Override
	public DatabaseTableFilter getValue() {
		return new DatabaseTableFilter() {
			@Override
			public boolean accept(final TableMetaData table) throws SQLException {
				final TableMetaData tableMetaData = _tdmKaEverythingMapper.map(table, _mappingDatabaseMetaData);

				return tableMetaData != null;
			}
		};
	}
}