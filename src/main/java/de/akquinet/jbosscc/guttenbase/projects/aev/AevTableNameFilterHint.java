package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseMetaDataTableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseMetaDataTableNameFilter;

public final class AevTableNameFilterHint extends DatabaseMetaDataTableNameFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public DatabaseMetaDataTableNameFilter getValue() {
    return new DatabaseMetaDataTableNameFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        return true;
        // final String lowerCase = tableName.toLowerCase();
        // return lowerCase.startsWith("ar_");
      }
    };
  }
}