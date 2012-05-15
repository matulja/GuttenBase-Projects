package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.util.List;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutor;

public class TdmKaCopy {
	private static final String TARGET = "TARGET";
	private static final String SOURCE = "SOURCE";
	private static final Logger LOG = Logger.getLogger(TdmKaCopy.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			final TdmKaPostgresqlConnectionInfo2 targetInfo = new TdmKaPostgresqlConnectionInfo2();

			connectorRepository.addConnectionInfo(SOURCE, new TdmKaPostgresqlConnectionInfo());
			connectorRepository.addConnectionInfo(TARGET, targetInfo);

			connectorRepository.addConnectorHint(SOURCE, new TdmKaTableNameFilterHint());

			final List<String> statements = new TdmKaMappingTablesCreator(connectorRepository, SOURCE, targetInfo.getSchema()).createStatements();

			new ScriptExecutor(connectorRepository).executeScript(TARGET, statements);

		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
