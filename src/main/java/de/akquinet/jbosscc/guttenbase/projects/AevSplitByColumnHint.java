package de.akquinet.jbosscc.guttenbase.projects;

import de.akquinet.jbosscc.guttenbase.hints.SplitByColumn;
import de.akquinet.jbosscc.guttenbase.hints.impl.SplitByColumnHint;

public final class AevSplitByColumnHint extends SplitByColumnHint {
  private static final long serialVersionUID = 1L;

  @Override
  public SplitByColumn getValue() {
    return new SplitByColumn() {
      @Override
      public String getSplitColumn(final String tableName) {
        final String lowerCase = tableName.toLowerCase();

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