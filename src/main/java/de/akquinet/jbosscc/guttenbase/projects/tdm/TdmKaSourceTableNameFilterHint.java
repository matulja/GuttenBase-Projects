package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

/**
 * Look only at tables starting with tdm_
 * 
 * <p>
 * &copy; 2012 akquinet tech@spree
 * </p>
 * 
 * @author M. Dahm
 */
public final class TdmKaSourceTableNameFilterHint extends RepositoryTableFilterHint {
	@Override
	public RepositoryTableFilter getValue() {
		return new RepositoryTableFilter() {
			@Override
			public boolean accept(final TableMetaData table) {
				final String lowerCase = table.getTableName().toLowerCase();
				return lowerCase.startsWith("tdm_");
			}
		};
	}
}