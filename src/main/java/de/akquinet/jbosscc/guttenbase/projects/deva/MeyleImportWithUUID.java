package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactory;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactoryHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopier;
import de.akquinet.jbosscc.guttenbase.tools.ScriptExecutor;
import de.akquinet.jbosscc.guttenbase.tools.TableConfigurationChecker;

public class MeyleImportWithUUID {
  public static final class IdColumnMapper implements ColumnDataMapper {
    private final Set<String> KNOWN_ID_COLUMNS = new HashSet<String>(Arrays.asList("id", "benutzer", "benutzer_liste", "angelegt_von",
        "zugeordnete_firma", "firma", "zubehoer", "komponente", "artikel_bestandteil", "artikel", "paarbeziehung", "kunde", "lieferant",
        "artikelprozess", "artikelbild", "artikelbezeichnung"));

    @Override
    public Object map(final Object value) {
      return value != null ? String.valueOf(value) : null;
    }

    @Override
    public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData) {
      final String columnName = sourceColumnMetaData.getColumnName().toLowerCase();
      final boolean columnNamesEqual = columnName.equalsIgnoreCase(targetColumnMetaData.getColumnName());

      return columnNamesEqual && (KNOWN_ID_COLUMNS.contains(columnName)) || columnName.endsWith("_id");
    }
  }

  private static final String TARGET = "meylePostgresql";
  private static final String SOURCE = "meyleImport";
  private static final Logger LOG = Logger.getLogger(MeyleImportWithUUID.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo("deva.jar"));
      connectorRepository.addConnectionInfo(TARGET, new MeylePostgresqlConnectionInfo2());
      connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));
      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));

      connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperFactoryHint() {
        private static final long serialVersionUID = 1L;

        @Override
        protected void addMappings(final DefaultColumnDataMapperFactory columnDataMapperFactory) {
          columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, new IdColumnMapper());
          columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, new IdColumnMapper());
        }
      });

      try {
        new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
      } catch (final SQLException e) {
        LOG.error("drop", e);
      }

      new ScriptExecutor(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-uuid.ddl");

      new TableConfigurationChecker(connectorRepository).checkTableConfiguration("meyleImport", "meylePostgresql");
      new DefaultTableCopier(connectorRepository).copyTables("meyleImport", "meylePostgresql");

      connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));
      new MeylePostgresqlSequenceUpdater(connectorRepository).updateSequences(TARGET);

      new ScriptExecutor(connectorRepository).executeScript(TARGET, "SELECT setval('public.sessioninfo_id_seq', 351, true);",
          "SELECT setval('public.workiteminfo_id_seq', 651, true);", "SELECT setval('public.hibernate_sequence', 259, true);");
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
