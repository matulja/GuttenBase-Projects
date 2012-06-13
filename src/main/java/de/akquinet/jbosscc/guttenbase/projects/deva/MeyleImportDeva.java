package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.Serializable;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.configuration.impl.PostgresqlTargetDatabaseConfiguration;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.ImportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutorTool;

public class MeyleImportDeva {
	private static final String TARGET = "meylePostgresql";
	private static final String SOURCE = "meyleImport";
	private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);
	private static Map<String, Serializable> _extraInformation;

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo("deva.jar"));
			connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo());
			connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));
			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));
			connectorRepository.addTargetDatabaseConfiguration(DatabaseType.POSTGRESQL, new PostgresqlTargetDatabaseConfiguration(
					connectorRepository, false));
			connectorRepository.addConnectorHint(SOURCE, new ImportDumpExtraInformationHint() {
				@Override
				public ImportDumpExtraInformation getValue() {
					return new ImportDumpExtraInformation() {

						@Override
						public void processExtraInformation(final Map<String, Serializable> extraInformation) throws Exception {
							_extraInformation = extraInformation;
						}
					};
				}
			});

			// try {
			// new ScriptExecutorTool(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
			// } catch (final SQLException e) {
			// LOG.error("drop", e);
			// }

			final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);
			// scriptExecutorTool.executeFileScript(TARGET, "deva/deva-postgresql.ddl");

			new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));
			new MeylePostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);

			for (final Entry<String, Serializable> entry : _extraInformation.entrySet()) {
				scriptExecutorTool.executeScript(TARGET, false, false,
						"SELECT setval('public." + entry.getKey().toLowerCase() + "', " + entry.getValue() + ", true);");
			}

			// scriptExecutorTool.executeScript(TARGET, false, false, "SELECT setval('public.sessioninfo_id_seq', 501, true);",
			// "SELECT setval('public.workiteminfo_id_seq', 1301, true);", "SELECT setval('public.hibernate_sequence', 317, true);");
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
