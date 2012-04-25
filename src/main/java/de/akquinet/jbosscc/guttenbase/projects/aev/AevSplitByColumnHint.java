package de.akquinet.jbosscc.guttenbase.projects.aev;

import de.akquinet.jbosscc.guttenbase.hints.SplitColumnHint;
import de.akquinet.jbosscc.guttenbase.repository.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;
import de.akquinet.jbosscc.guttenbase.tools.SplitColumn;

public final class AevSplitByColumnHint extends SplitColumnHint {
  private static final long serialVersionUID = 1L;

  @Override
  public SplitColumn getValue() {
    return new SplitColumn() {
      @Override
      public ColumnMetaData getSplitColumn(final TableMetaData table) {
        final String lowerCase = table.getTableName().toLowerCase();

        if (lowerCase.endsWith("ar_leart") || lowerCase.endsWith("ar_arztgruppe") || lowerCase.endsWith("ar_pb")
            || lowerCase.endsWith("ar_praxisbes")) {
          return table.getColumnMetaData("TKID");
        } else {
          return table.getColumnMetaData("OID");
        }
      }
    };
  }
}