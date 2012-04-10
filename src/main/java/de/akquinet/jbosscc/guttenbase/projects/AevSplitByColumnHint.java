package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.hints.SplitColumn;
import de.akquinet.jbosscc.guttenbase.hints.SplitColumnHint;
import de.akquinet.jbosscc.guttenbase.repository.TableMetaData;

public final class AevSplitByColumnHint extends SplitColumnHint {
  private static final long serialVersionUID = 1L;

  @Override
  public SplitColumn getValue() {
    return new SplitColumn() {
      @Override
      public String getSplitColumn(final TableMetaData table) {
        final String lowerCase = table.getTableName().toLowerCase();

        if (lowerCase.endsWith("ar_leart") || lowerCase.endsWith("ar_arztgruppe") || lowerCase.endsWith("ar_pb")
            || lowerCase.endsWith("ar_praxisbes")) {
          return "TKID";
        } else {
          return "OID";
        }
      }
    };
  }
}