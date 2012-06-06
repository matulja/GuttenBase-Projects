package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TdmKaMappingTablesDuplicateRemoverTool {
	private final String _targetSchema;

	public TdmKaMappingTablesDuplicateRemoverTool(final String targetSchema) {
		_targetSchema = targetSchema;
	}

	public List<String> removeDuplicates(final String... tableNames) throws SQLException {
		final String tempTable = _targetSchema + ".temp_";
		final List<String> statements = new ArrayList<String>();

		for (final String tableName : tableNames) {
			final String table = _targetSchema + "." + tableName;
			statements.add("CREATE TABLE " + tempTable + " AS SELECT * FROM " + table + " WHERE 1 > 2;");
			statements.add("INSERT INTO " + tempTable + " SELECT DISTINCT * FROM " + table + ";");
			statements.add("DELETE FROM " + table + ";");
			statements.add("INSERT INTO " + table + " SELECT DISTINCT * FROM " + tempTable + ";");
			statements.add("DROP TABLE " + tempTable + ";");
		}

		return statements;
	}
}
