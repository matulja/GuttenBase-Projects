package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultZipExporterClassResources;

public class PostgresBackupClassResources extends DefaultZipExporterClassResources {
  public static final String DEVA_DDL = "sql/deva-postgresql-1.1.5.ddl";
  public static final String POSTGRESQL_DROP = "sql/deva-postgresql-drop.sql";

  @Override
  public List<Class<?>> getClassResources() {
    final List<Class<?>> result = super.getClassResources();
    result.add(org.postgresql.Driver.class);
    return result;
  }

  @Override
  public Class<?> getStartupClass() {
    return MeyleRestorePostgresql.class;
  }

  @Override
  public Map<String, URL> getUrlResources() {
    final Map<String, URL> result = new HashMap<String, URL>();

    result.put(DEVA_DDL, this.getClass().getResource("/deva/deva-postgresql-1.1.5.ddl"));
    result.put(POSTGRESQL_DROP, this.getClass().getResource("/deva/deva-postgresql-drop.sql"));

    return result;
  }

}
