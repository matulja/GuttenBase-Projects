package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.File;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class MeyleShrinkDump {
  private static final String TARGET = "H2";
  private static final String SOURCE = "DUMP";
  private static final Logger LOG = Logger.getLogger(MeyleShrinkDump.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo(new File("deva-postgresql.jar").toURI().toURL()));
      connectorRepository.addConnectionInfo(TARGET, new ExportDumpConnectorInfo(SOURCE, "deva-shrunk.jar"));

      connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperProviderHint() {
        @Override
        protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory) {
          super.addMappings(columnDataMapperFactory);
          columnDataMapperFactory.addMapping(ColumnType.CLASS_BLOB, ColumnType.CLASS_BLOB, new MeyleBlobDataMapper());
        }
      });

      new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);
    } catch (final Exception e) {
      LOG.error("main", e);
    }
  }
}
