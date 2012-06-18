package de.akquinet.jbosscc.guttenbase.projects.kommportal;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.ExportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.projects.aev.KvbbCopyAev;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.ReadTableDataTool;

public class KommportalExport {
	private static final Logger LOG = Logger.getLogger(KvbbCopyAev.class);

	private static final String EXPORT = "export";
	private static final String SOURCE = "oracle";

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new KommportalOracleConnectionInfo());
			connectorRepository.addConnectionInfo(EXPORT, new ExportDumpConnectorInfo(SOURCE, "kommportal.jar"));


			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, EXPORT);
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
