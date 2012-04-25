package de.akquinet.jbosscc.guttenbase.projects.tdm;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactory;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperFactoryHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.TableConfigurationChecker;

public class TdmKaCopyWithUUID {
  public static final class IdColumnMapper implements ColumnDataMapper {
    // private final Set<String> KNOWN_ID_COLUMNS = new HashSet<String>(Arrays.asList("id", "benutzer", "benutzer_liste", "angelegt_von",
    // "zugeordnete_firma", "firma", "zubehoer", "komponente", "artikel_bestandteil", "artikel", "paarbeziehung", "kunde", "lieferant",
    // "artikelprozess", "artikelbild", "artikelbezeichnung"));

    @Override
    public Object map(final Object value) {
      return value != null ? String.valueOf(value) : null;
    }

    @Override
    public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData) {
      final String columnName = sourceColumnMetaData.getColumnName().toLowerCase();
      final boolean columnNamesEqual = columnName.equalsIgnoreCase(targetColumnMetaData.getColumnName());

      return columnNamesEqual && (columnName.endsWith("_id") || "id".equals(columnName));
    }
  }

  private static final String TARGET = "TARGET";
  private static final String SOURCE = "SOURCE";
  private static final Logger LOG = Logger.getLogger(TdmKaCopyWithUUID.class);

  public static void main(final String[] args) {
    try {
      final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

      connectorRepository.addConnectionInfo(SOURCE, new TdmKaPostgresqlConnectionInfo());
      connectorRepository.addConnectionInfo(TARGET, new TdmKaPostgresqlConnectionInfo2());

      connectorRepository.addConnectorHint(SOURCE, new TdmKaTableNameFilterHint());

      connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperFactoryHint() {
        private static final long serialVersionUID = 1L;

        @Override
        protected void addMappings(final DefaultColumnDataMapperFactory columnDataMapperFactory) {
          columnDataMapperFactory.addMapping(ColumnType.CLASS_LONG, ColumnType.CLASS_STRING, new IdColumnMapper());
          columnDataMapperFactory.addMapping(ColumnType.CLASS_BIGDECIMAL, ColumnType.CLASS_STRING, new IdColumnMapper());
        }
      });

      new TableConfigurationChecker(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
      // new DefaultTableCopier(connectorRepository).copyTables(SOURCE, TARGET);
    } catch (final SQLException e) {
      LOG.error("main", e);
    }
  }
}
