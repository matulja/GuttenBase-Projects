package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;

public class MeyleImportDeva {
	private static final String TARGET = "meylePostgresql";
	private static final String SOURCE = "meyleImport";
	private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo("deva.jar"));
			connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo());
			connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));
			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));

			try {
				new ScriptExecutorTool(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
			} catch (final SQLException e) {
				LOG.error("drop", e);
			}

			new ScriptExecutorTool(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql.ddl");

			new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));
			new MeylePostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);

			new ScriptExecutorTool(connectorRepository).executeScript(TARGET, false, false,
					"SELECT setval('public.sessioninfo_id_seq', 351, true);", "SELECT setval('public.workiteminfo_id_seq', 701, true);",
					"SELECT setval('public.hibernate_sequence', 259, true);");
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
