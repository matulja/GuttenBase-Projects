package de.akquinet.jbosscc.guttenbase.projects.kommportal;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import de.akquinet.jbosscc.guttenbase.export.ImportDumpConnectionInfo;
import de.akquinet.jbosscc.guttenbase.export.ImportDumpExtraInformation;
import de.akquinet.jbosscc.guttenbase.hints.ColumnMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.ImportDumpExtraInformationHint;
import de.akquinet.jbosscc.guttenbase.hints.NumberOfRowsPerBatchHint;
import de.akquinet.jbosscc.guttenbase.hints.TableMapperHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnMapper;
import de.akquinet.jbosscc.guttenbase.mapping.TableMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.meta.ColumnType;
import de.akquinet.jbosscc.guttenbase.meta.DatabaseMetaData;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;
import de.akquinet.jbosscc.guttenbase.projects.deva.MeyleTableNameFilterHint;
import de.akquinet.jbosscc.guttenbase.repository.ConnectorRepository;
import de.akquinet.jbosscc.guttenbase.repository.impl.ConnectorRepositoryImpl;
import de.akquinet.jbosscc.guttenbase.tools.CheckSchemaCompatibilityTool;
import de.akquinet.jbosscc.guttenbase.tools.DefaultTableCopyTool;
import de.akquinet.jbosscc.guttenbase.tools.NumberOfRowsPerBatch;

public class KommportalImportDeva {
	private static final String TARGET = "Oracle";
	private static final String SOURCE = "meyleImport";
	private static final Logger LOG = Logger.getLogger(KommportalImportDeva.class);
	private static Map<String, Serializable> _extraInformation;

	public static void main(final String[] args) {
		try {
			final ConnectorRepository connectorRepository = new ConnectorRepositoryImpl();

			connectorRepository.addConnectionInfo(SOURCE, new ImportDumpConnectionInfo("deva.jar"));
			connectorRepository.addConnectionInfo(TARGET, new MeyleOracleConnectionInfo());
			connectorRepository.addConnectorHint(SOURCE, new MeyleTableNameFilterHint(true, true));
			connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(true, true));
			connectorRepository.addConnectorHint(SOURCE, new ImportDumpExtraInformationHint() {
				@Override
				public ImportDumpExtraInformation getValue() {
					return new ImportDumpExtraInformation() {

						@Override
						public void processExtraInformation(final Map<String, Serializable> extraInformation) throws Exception {
							_extraInformation = extraInformation;
						}
					};
				}
			});

			connectorRepository.addConnectorHint(TARGET, new TableMapperHint() {
				private final Map<String, String> _tableMap = new HashMap<String, String>();

				@Override
				public TableMapper getValue() {
					_tableMap.put("DEVA_ARTIKEL_VERANTWORTLICHE", "DEVA_ARTIKEL_V");
					_tableMap.put("DEVA_ARTIKEL_ZUSATZINFORMATIONEN", "DEVA_ARTIKEL_ZINFO");
					_tableMap.put("DEVA_BEZEICHNUNG_ZUSATZINFORMATION", "DEVA_BEZEICHNUNG_ZINFO");
					_tableMap.put("DEVA_BEZEICHUNG_PROZESS_SCHRITT", "DEVA_BEZEICHUNG_PS");
					_tableMap.put("DEVA_BPMN_DEFINITION_TASK_HANDLER_NAMES", "DEVA_BPMN_DEFINITION_THN");
					_tableMap.put("DEVA_FIRMA_SOLLZEITEN_ARTIKEL", "DEVA_FIRMA_SOLLZEITEN_A");
					_tableMap.put("DEVA_FIRMA_SOLLZEITEN_KOMPONENTE", "DEVA_FIRMA_SOLLZEITEN_K");
					_tableMap.put("DEVA_KOMPONENTE_VERANTWORTLICHE", "DEVA_KOMPONENTE_V");
					_tableMap.put("DEVA_KOMPONENTE_ZUSATZINFORMATIONEN", "DEVA_KOMPONENTE_ZINFO");
					_tableMap.put("DEVA_ROLLE_AKTIONS_BERECHTIGUNGEN", "DEVA_ROLLE_AKTIONS_B");
					_tableMap.put("DEVA_ROLLE_SICHT_BERECHTIGUNGEN", "DEVA_ROLLE_SICHT_B");
					_tableMap.put("DEVA_SOLLZEIT_WDH_KLASSIFIKATION", "DEVA_SOLLZEIT_WDH_K");
					_tableMap.put("DEVA_UEBERSETZUNG_KOMPONENTE", "DEVA_UEBERSETZUNG_K");
					_tableMap.put("DEVA_UEBERSETZUNG_PRODUKTGRUPPE", "DEVA_UEBERSETZUNG_P");
					_tableMap.put("DEVA_UEBERSETZUNG_PROZESS_SCHRITT", "DEVA_UEBERSETZUNG_PS");
					_tableMap.put("DEVA_UEBERSETZUNG_ZUSATZINFORMATION", "DEVA_UEBERSETZUNG_ZINFO");
					_tableMap.put("JBPM_EMAIL_NOTIFICATION", "JBPM_EMAIL_NOT");
					_tableMap.put("JBPM_EMAIL_NOTIFICATION_JBPM_EMAIL_HEADER", "JBPM_EMAIL_NOT_HEAD");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_BAS", "JBPM_PA_BAS");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_STAKEHOLDERS", "JBPM_PA_STAKEHOLDERS");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_EXCLOWNERS", "JBPM_PA_EXCLOWNERS");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_POTOWNERS", "JBPM_PA_POTOWNERS");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_RECIPIENTS", "JBPM_PA_RECIPIENTS");
					_tableMap.put("JBPM_PEOPLEASSIGNMENTS_STAKEHOLDERS", "JBPM_PA_STAKEHOLDERS");
					_tableMap.put("JBPM_PROCESSINSTANCE_INFO", "JBPM_PI_INFO");
					_tableMap.put("JBPM_PROCESSINSTANCE_INFO_EVENTTYPES", "JBPM_PI_INFO_ET");
					_tableMap.put("JBPM_REASSIGNMENT_POTENTIALOWNERS", "JBPM_RA_POTOWNERS");

					return new TableMapper() {
						@Override
						public TableMetaData map(final TableMetaData source, final DatabaseMetaData targetDatabaseMetaData) throws SQLException {
							final String tableName1 = source.getTableName().toUpperCase();
							String tableName2 = _tableMap.get(tableName1);

							if (tableName2 == null) {
								tableName2 = tableName1;
							}

							return targetDatabaseMetaData.getTableMetaData(tableName2);
						}
					};
				}
			});

			connectorRepository.addConnectorHint(TARGET, new NumberOfRowsPerBatchHint() {
				@Override
				public NumberOfRowsPerBatch getValue() {
					return new NumberOfRowsPerBatch() {
						@Override
						public boolean useMultipleValuesClauses(final TableMetaData targetTableMetaData) {
							return false;
						}

						@Override
						public int getNumberOfRowsPerBatch(final TableMetaData targetTableMetaData) {
							return 2000;
						}
					};
				}
			});

			connectorRepository.addConnectorHint(TARGET, new DefaultColumnDataMapperProviderHint() {
				@Override
				protected void addMappings(final DefaultColumnDataMapperProvider columnDataMapperFactory) {
					super.addMappings(columnDataMapperFactory);

					columnDataMapperFactory.addMapping(ColumnType.CLASS_STRING, ColumnType.CLASS_STRING, new ColumnDataMapper() {
						@Override
						public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData)
								throws SQLException {
							// final String columnName = sourceColumnMetaData.getColumnName().toUpperCase();
							// return columnName.equals("ORIG_MEYLENUMMER") || columnName.equals("RAW_MEYLENUMMER");

							return true;
						}

						@Override
						public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData, final Object value)
								throws SQLException {
							// Workaround Oracle bug
							if (value != null && "".equals(value.toString())) {
								return " ";
							} else {
								return value;
							}
						}
					});
				}
			});

			connectorRepository.addConnectorHint(TARGET, new ColumnMapperHint() {
				private final Map<String, String> _columnMap = new HashMap<String, String>();

				@Override
				public ColumnMapper getValue() {
					_columnMap.put("JBPM_EMAIL_NOTIFICATION_ID", "JBPM_EMAIL_NOT_ID");
					_columnMap.put("JBPM_PROCESSINSTANCE_INFO_ID", "JBPM_PIINFO_ID");

					return new ColumnMapper() {
						@Override
						public List<ColumnMetaData> map(final ColumnMetaData source, final TableMetaData targetTableMetaData) throws SQLException {
							final String columnName1 = source.getColumnName().toUpperCase();
							String columnName2 = _columnMap.get(columnName1);

							if (columnName2 == null) {
								columnName2 = columnName1;
							}

							assert columnName2 != null : "columnName2 != null";

							final ColumnMetaData columnMetaData = targetTableMetaData.getColumnMetaData(columnName2);

							assert columnMetaData != null : "columnMetaData != null: " + columnName1 + " vs. " + columnName2;

							return Arrays.asList(columnMetaData);
						}
					};
				}
			});

			// try {
			// new ScriptExecutorTool(connectorRepository).executeFileScript("meylePostgresql", "deva/deva-postgresql-drop.sql");
			// } catch (final SQLException e) {
			// LOG.error("drop", e);
			// }

			// final ScriptExecutorTool scriptExecutorTool = new ScriptExecutorTool(connectorRepository);
			// scriptExecutorTool.executeFileScript(TARGET, "deva/deva-oracle.ddl");

			new CheckSchemaCompatibilityTool(connectorRepository).checkTableConfiguration(SOURCE, TARGET);
			new DefaultTableCopyTool(connectorRepository).copyTables(SOURCE, TARGET);

			// connectorRepository.addConnectorHint(TARGET, new MeyleTableNameFilterHint(false, false));

			// new MeylePostgresqlSequenceUpdateTool(connectorRepository).updateSequences(TARGET);
			//
			// for (final Entry<String, Serializable> entry : _extraInformation.entrySet()) {
			// scriptExecutorTool.executeScript(TARGET, false, false,
			// "SELECT setval('public." + entry.getKey().toLowerCase() + "', " + entry.getValue() + ", true);");
			// }

			// scriptExecutorTool.executeScript(TARGET, false, false, "SELECT setval('public.sessioninfo_id_seq', 501, true);",
			// "SELECT setval('public.workiteminfo_id_seq', 1301, true);", "SELECT setval('public.hibernate_sequence', 317, true);");
		} catch (final Exception e) {
			LOG.error("main", e);
		}
	}
}
