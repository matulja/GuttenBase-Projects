package de.akquinet.jbosscc.guttenbase.projects.ts;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;

public class StillTsMdbCopy {
	private static final String SOURCE = "SOURCE";
	private static final String DUMP = "DUMP";

	private static final Logger LOG = Logger.getLogger(StillTsMdbCopy.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();
			connectorRepository.addConnectionInfo(SOURCE, new StillTsAccessConnectionInfo());
			connectorRepository.addConnectionInfo(DUMP, new ExportDumpConnectionInfo(SOURCE, "stillts.jar"));

			new DefaultTableCopier(connectorRepository).copyTables(SOURCE, DUMP);
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
