package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.hints.TableNameFilter;
import de.akquinet.jbosscc.guttenbase.hints.impl.TableNameFilterHint;

public final class MeyleTableNameFilterHint extends TableNameFilterHint {
  private static final long serialVersionUID = 1L;

  public TableNameFilter getValue() {
    return new TableNameFilter() {
      public boolean accept(final String tableName) {
        final String lowerCase = tableName.toLowerCase();
        return lowerCase.startsWith("deva_") || lowerCase.startsWith("drools_") || lowerCase.startsWith("jbpm_")
            || lowerCase.contains("_seq");
      }
    };
  }
}