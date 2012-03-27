package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.hints.TableNameFilter;
import de.akquinet.jbosscc.guttenbase.hints.TableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;

public final class AevTableNameFilterHint extends TableNameFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public TableNameFilter getValue() {
    return new TableNameFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        return true;
        // final String lowerCase = tableName.toLowerCase();
        // return lowerCase.startsWith("ar_");
      }
    };
  }
}