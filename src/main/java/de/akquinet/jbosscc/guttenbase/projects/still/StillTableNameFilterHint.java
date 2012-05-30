package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

public class StillTableNameFilterHint extends RepositoryTableFilterHint{

	private static final long serialVersionUID = 1L;

	@Override
	public RepositoryTableFilter getValue() {
		return new RepositoryTableFilter() {
			@Override
			public boolean accept(TableMetaData table) throws SQLException {
				return table.getTableName().compareTo("KOPF_DAILY")>=0;
			}
		};
	}

}
