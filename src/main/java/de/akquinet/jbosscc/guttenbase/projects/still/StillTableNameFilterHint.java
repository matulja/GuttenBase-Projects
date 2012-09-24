package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

public class StillTableNameFilterHint extends RepositoryTableFilterHint {
	@Override
	public RepositoryTableFilter getValue() {
		return new RepositoryTableFilter() {
			@Override
			public boolean accept(final TableMetaData table) throws SQLException {
				return table.getTableName().equalsIgnoreCase("SAV_TEMP_CH");
				
				//return table.getTableName().toUpperCase().compareTo("KOPF_TEMP_DE")>=0;
			}
		};
	}
}
