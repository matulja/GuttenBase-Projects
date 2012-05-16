package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;

public final class AevTableNameFilterHint extends DatabaseTableFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public DatabaseTableFilter getValue() {
    return new DatabaseTableFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        return true;
        // final String lowerCase = tableName.toLowerCase();
        // return lowerCase.startsWith("ar_");
      }
    };
  }
}