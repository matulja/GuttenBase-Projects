package de.akquinet.jbosscc.guttenbase.projects.tdm;

import de.akquinet.jbosscc.guttenbase.hints.DatabaseMetaDataTableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.repository.DatabaseMetaDataTableNameFilter;

public final class TdmKaTableNameFilterHint extends DatabaseMetaDataTableNameFilterHint {
  private static final long serialVersionUID = 1L;

  @Override
  public DatabaseMetaDataTableNameFilter getValue() {
    return new DatabaseMetaDataTableNameFilter() {
      @Override
      public boolean accept(final TableMetaData table) {
        final String lowerCase = table.getTableName().toLowerCase();
        return lowerCase.startsWith("tdm_");
      }
    };
  }
}