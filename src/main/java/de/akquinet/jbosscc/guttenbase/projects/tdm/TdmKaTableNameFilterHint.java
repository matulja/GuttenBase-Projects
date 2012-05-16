package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseTableFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseTableFilter;

public final class TdmKaTableNameFilterHint extends DatabaseTableFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public DatabaseTableFilter getValue() {
    return new DatabaseTableFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        final String lowerCase = table.getTableName().toLowerCase();
        return lowerCase.startsWith("tdm_");
      }
    };
  }
}