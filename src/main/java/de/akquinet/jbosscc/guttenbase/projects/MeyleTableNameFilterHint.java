package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.hints.TableNameFilter;
import de.akquinet.jbosscc.guttenbase.hints.TableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;

public final class MeyleTableNameFilterHint extends TableNameFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public TableNameFilter getValue() {
    return new TableNameFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        final String lowerCase = table.getTableName().toLowerCase();
        return lowerCase.startsWith("deva_") || lowerCase.startsWith("drools_") || lowerCase.startsWith("jbpm_")
        /* || lowerCase.contains("_seq") */;
      }
    };
  }
}