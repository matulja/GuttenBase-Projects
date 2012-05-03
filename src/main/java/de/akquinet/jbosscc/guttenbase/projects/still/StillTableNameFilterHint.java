package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseMetaDataTableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseMetaDataTableNameFilter;

public class StillTableNameFilterHint extends DatabaseMetaDataTableNameFilterHint{

	private static final long serialVersionUID = 1L;

	@Override
	public DatabaseMetaDataTableNameFilter getValue() {
		return new DatabaseMetaDataTableNameFilter() {
			@Override
			public boolean accept(TableMetaData table) throws SQLException {
				return table.getTableName().compareTo("KOPF_DAILY")>=0;
			}
		};
	}

}
