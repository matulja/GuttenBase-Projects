package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseMetaDataTableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseMetaDataTableNameFilter;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;

public final class MeyleTableNameFilterHint extends DatabaseMetaDataTableNameFilterHint {
  private static final long serialVersionUID = 1L;

  private final boolean _withJbpm;
  private final boolean _withDrools;

  public MeyleTableNameFilterHint(final boolean withJbpm, final boolean withDrools) {
    _withJbpm = withJbpm;
    _withDrools = withDrools;
  }

  @Override
  public DatabaseMetaDataTableNameFilter getValue() {
    return new DatabaseMetaDataTableNameFilter() {
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