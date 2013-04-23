package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultZipExporterClassResources;

public class DevaExporterClassResources extends DefaultZipExporterClassResources {
	public static final String DEVA_DDL = "sql/deva-postgresql-1.1.0.ddl";
	public static final String POSTGRESQL_DROP = "sql/deva-postgresql-drop.sql";

	@Override
	public Class<?> getStartupClass() {
		return MeyleImportDeva.class;
	}

	@Override
	public List<Class<?>> getClassResources() {
		final List<Class<?>> result = super.getClassResources();
		result.add(org.postgresql.Driver.class);
		return result;
	}

	@Override
	public Map<String, URL> getUrlResources() {
		final Map<String, URL> result = new HashMap<String, URL>();

		result.put(POSTGRESQL_DROP, this.getClass().getResource("/deva/deva-postgresql-drop.sql"));
		result.put(DEVA_DDL, this.getClass().getResource("/deva/deva-postgresql-1-1.0.ddl"));
		result.put("sql/deltascript-1.1.3.sql", this.getClass().getResource("/deva/deltascript-1.1.3.sql"));
		result.put("sql/deltascript-1.1.4.sql", this.getClass().getResource("/deva/deltascript-1.1.4.sql"));
		result.put("sql/deltascript-1.1.5.sql", this.getClass().getResource("/deva/deltascript-1.1.5.sql"));

		return result;
	}
}