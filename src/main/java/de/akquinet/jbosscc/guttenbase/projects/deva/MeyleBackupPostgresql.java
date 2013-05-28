package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.zip.ZipExporterClassResources;
import de.akquinet.jbosscc.guttenbase.hints.ZipExporterClassResourcesHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;

public class MeyleBackupPostgresql {

  public static final Logger LOG = Logger.getLogger(MeyleBackupPostgresql.class);
  private static final String MEYLE_POSTGRES = "POSTGRES";
  private static final String DUMP = "DUMP";

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(MEYLE_POSTGRES, new MeylePostgresqlConnectionInfo());
      connectorRepository.addConnectionInfo(DUMP, new ExportDumpConnectorInfo(MEYLE_POSTGRES, "deva-postgresql.jar"));

      // connectorRepository.addConnectorHint(DUMP, new ExportDumpExtraInformationHint() {
      // @Override
      // public ExportDumpExtraInformation getValue() {
      // return new DevaSequenceNumberExporter();
      // }
      // });

      connectorRepository.addConnectorHint(DUMP, new ZipExporterClassResourcesHint() {
        @Override
        public ZipExporterClassResources getValue() {
          return new PostgresBackupClassResources();
        }
      });

      new DefaultTableCopyTool(connectorRepository).copyTables(MEYLE_POSTGRES, DUMP);
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }

}
