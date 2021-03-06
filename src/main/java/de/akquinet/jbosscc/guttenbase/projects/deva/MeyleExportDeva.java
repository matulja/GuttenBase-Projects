package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpConnectorInfo;
import de.akquinet.jbosscc.guttenbase.export.ExportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.export.zip.ZipExporterClassResources;
import de.akquinet.jbosscc.guttenbase.hints.ExportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.hints.ZipExporterClassResourcesHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.SwingScriptExecutorProgressIndicatorHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.SwingTableCopyProgressIndicatorHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import org.apache.log4j.Logger;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MeyleExportDeva
{
  public static final String MEYLE_EXPORT = "meyleExport";
  public static final String MEYLE_MS_SQL = "meyleMsSql";

  private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

  public static final Logger LOG = Logger.getLogger(MeyleExportDeva.class);

  public static void main(final String[] args)
  {
    try
    {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(MEYLE_MS_SQL, new MeyleMsSqlConnectionInfo());
      connectorRepository.addConnectionInfo(MEYLE_EXPORT, new ExportDumpConnectorInfo(MEYLE_MS_SQL, "deva-dump-" + DATE_FORMAT.format(new Date()) + ".jar"));
      connectorRepository.addConnectorHint(MEYLE_EXPORT, new SwingTableCopyProgressIndicatorHint());
      connectorRepository.addConnectorHint(MEYLE_EXPORT, new SwingScriptExecutorProgressIndicatorHint());

      connectorRepository.addConnectorHint(MEYLE_EXPORT, new ExportDumpExtraInformationHint()
      {
        @Override
        public ExportDumpExtraInformation getValue()
        {
          return new DevaSequenceNumberExporter();
        }
      });

      connectorRepository.addConnectorHint(MEYLE_EXPORT, new ZipExporterClassResourcesHint()
      {
        @Override
        public ZipExporterClassResources getValue()
        {
          return new DevaExporterClassResources();
        }
      });

      new DefaultTableCopyTool(connectorRepository).copyTables(MEYLE_MS_SQL, MEYLE_EXPORT);
    }
    catch (final SQLException e)
    {
      LOG.error("main", e);
    }
  }
}
