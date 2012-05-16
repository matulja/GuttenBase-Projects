package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;

public class StillTableNameFilterHint extends DatabaseTableFilterHint{

	private static final long serialVersionUID = 1L;

	@Override
	public DatabaseTableFilter getValue() {
		return new DatabaseTableFilter() {
			@Override
			public boolean accept(TableMetaData table) throws SQLException {
				return table.getTableName().compareTo("KOPF_DAILY")>=0;
			}
		};
	}

}
