package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;

public final class MeyleTableNameFilterHint extends DatabaseTableFilterHint {
  private static final long serialVersionUID = 1L;

  private final boolean _withJbpm;
  private final boolean _withDrools;

  public MeyleTableNameFilterHint(final boolean withJbpm, final boolean withDrools) {
    _withJbpm = withJbpm;
    _withDrools = withDrools;
  }

  @Override
  public DatabaseTableFilter getValue() {
    return new DatabaseTableFilter() {
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