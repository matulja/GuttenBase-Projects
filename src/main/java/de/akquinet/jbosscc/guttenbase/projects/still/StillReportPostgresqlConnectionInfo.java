package de.akquinet.jbosscc.guttenbase.projects.still;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectionInfo;

public class StillReportPostgresqlConnectionInfo extends URLConnectionInfo {
  private static final long serialVersionUID = 1L;

  public StillReportPostgresqlConnectionInfo() {
    super("jdbc:postgresql://localhost:5432/stillreport_import", "stillreport", "stillreport", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL);
  }
}
