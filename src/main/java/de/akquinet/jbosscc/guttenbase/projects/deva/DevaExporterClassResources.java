package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.defaults.impl.DefaultZipExporterClassResources;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DevaExporterClassResources extends DefaultZipExporterClassResources
{
  // public static final String DELTA3 = "sql/deltascript-1.1.5.sql";
  public static final String DEVA_DDL = "sql/deva-postgresql-1.1.5.ddl";
  public static final String POSTGRESQL_DROP = "sql/deva-postgresql-drop.sql";

  @Override
  public Class<?> getStartupClass()
  {
    return MeyleImportDeva.class;
  }

  @Override
  public List<Class<?>> getClassResources()
  {
    final List<Class<?>> result = super.getClassResources();
    result.add(org.postgresql.Driver.class);
    result.add(com.mysql.jdbc.Driver.class);
    result.add(net.sourceforge.jtds.jdbc.Driver.class);
    return result;
  }

  @Override
  public Map<String, URL> getUrlResources()
  {
    final Map<String, URL> result = new HashMap<String, URL>();

    result.put(POSTGRESQL_DROP, this.getClass().getResource("/deva/deva-postgresql-drop.sql"));
    result.put(DEVA_DDL, this.getClass().getResource("/deva/deva-postgresql-1.1.5.ddl"));

    return result;
  }
}
