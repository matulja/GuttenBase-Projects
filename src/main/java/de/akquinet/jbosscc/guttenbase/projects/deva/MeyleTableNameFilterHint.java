package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.hints.TableNameFilter;
import de.akquinet.jbosscc.guttenbase.hints.TableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;

public final class MeyleTableNameFilterHint extends TableNameFilterHint {
  private static final long serialVersionUID = 1L;

  private final boolean _withJbpm;
  private final boolean _withDrools;

  public MeyleTableNameFilterHint(final boolean withJbpm, final boolean withDrools) {
    _withJbpm = withJbpm;
    _withDrools = withDrools;
  }

  @Override
  public TableNameFilter getValue() {
    return new TableNameFilter() {
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