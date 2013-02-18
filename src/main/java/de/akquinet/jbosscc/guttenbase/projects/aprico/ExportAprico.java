package de.akquinet.jbosscc.guttenbase.projects.aprico;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class ExportAprico {
	private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

	private static final String MEYLE_EXPORT = "meyleExport";
	private static final String MEYLE_ORACLE = "oracle";

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(MEYLE_ORACLE, new ApricoOracleConnectionInfo());
			connectorRepository.addConnectionInfo(MEYLE_EXPORT, new ExportDumpConnectorInfo(MEYLE_ORACLE,
					"aprico.jar"));

			new DefaultTableCopyTool(connectorRepository).copyTables(MEYLE_ORACLE, MEYLE_EXPORT);
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
