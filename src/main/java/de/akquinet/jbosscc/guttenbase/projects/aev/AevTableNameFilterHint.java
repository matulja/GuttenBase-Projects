package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.hints.RepositoryTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.RepositoryTableFilter;

public final class AevTableNameFilterHint extends RepositoryTableFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public RepositoryTableFilter getValue() {
    return new RepositoryTableFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        return true;
        // final String lowerCase = tableName.toLowerCase();
        // return lowerCase.startsWith("ar_");
      }
    };
  }
}