package de.akquinet.jbosscc.guttenbase.projects.still;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class StillReportCopyDb {
	private static final Logger LOG = Logger.getLogger(StillReportCopyDb.class);

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo("source", new StillReportMysqlConnectionInfo());
			connectorRepository.addConnectionInfo("target", new StillReportPostgresqlConnectionInfo());
			connectorRepository.addConnectorHint("source", new StillTableNameFilterHint());
			connectorRepository.addConnectorHint("target", new StillTableNameFilterHint());
			connectorRepository.addConnectorHint("target", new DefaultColumnDataMapperProviderHint() {
				@Override
				protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory) {
					super.addMappings(columnDataMapperFactory);
					columnDataMapperFactory.addMapping(ColumnType.CLASS_STRING, ColumnType.CLASS_STRING, new StillColumnDataMapper());
				}
			});
			
			
//			new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration("source", "target");
			new DefaultTableCopyTool(connectorRepository).copyTables("source", "target");
		} catch (final SQLException e) {
			LOG.error("main", e);
		}
	}
}
