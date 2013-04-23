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

			final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);

			try {
				scriptExecutorTool.executeFileScript(TARGET, "sql/deva-postgresql-drop.sql");
			} catch (final Exception e) {
				LOG.warn("Drop table failed", e);
			}

			connectorRepository.refreshDatabaseMetaData(TARGET);

			scriptExecutorTool.executeFileScript(TARGET, "sql/deva-postgresql.ddl");

			new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));

			for (final Entry<String, Serializable> entry : _extraInformation.entrySet()) {
				scriptExecutorTool.executeScript(TARGET, false, false, "SELECT setval('public." + entry.getKey().toLowerCase() + "', "
				    + entry.getValue() + ", true);");
			}

			new MeylePostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
