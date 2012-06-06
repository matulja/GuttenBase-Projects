package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

public final class MeyleTableNameFilterHint extends RepositoryTableFilterHint {
	private final boolean _withJbpm;
	private final boolean _withDrools;

	public MeyleTableNameFilterHint(final boolean withJbpm, final boolean withDrools) {
		_withJbpm = withJbpm;
		_withDrools = withDrools;
	}

	@Override
	public RepositoryTableFilter getValue() {
		return new RepositoryTableFilter() {
			@Override
			public boolean accept(final TableMetaData table) {
				final String lowerCase = table.getTableName().toLowerCase();
				return lowerCase.startsWith("deva_") //
						|| (_withJbpm && lowerCase.startsWith("jbpm_")) //
						|| (_withDrools && (lowerCase.startsWith("drools_")));
			}
		};
	}
}