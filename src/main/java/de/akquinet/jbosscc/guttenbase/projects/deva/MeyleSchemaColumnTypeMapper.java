package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.ConnectorInfo;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.tools.schema.DefaultSchemaColumnTypeMapper;

import java.util.Arrays;

public class MeyleSchemaColumnTypeMapper extends DefaultSchemaColumnTypeMapper
{
  public static final String MSSQL_IDCOLUMNTYPE = " IDENTITY";
  public static final String MSSQL_BLOBTYPE = "IMAGE";
  private ConnectorInfo _connectorInfo;

  public MeyleSchemaColumnTypeMapper(final ConnectorInfo connectorInfo)
  {
    _connectorInfo = connectorInfo;
  }

  @Override
  public String getColumnType(final ColumnMetaData columnMetaData)
  {
    final String columnType = columnMetaData.getColumnTypeName().toUpperCase();

    if (columnType.endsWith(MSSQL_IDCOLUMNTYPE))
    {
      return columnType.substring(0, columnType.length() - MSSQL_IDCOLUMNTYPE.length());
    }
    else if (_connectorInfo.getDatabaseType() == DatabaseType.MYSQL && "TIMESTAMP".equalsIgnoreCase(columnType))
    {
      return "DATETIME";
    }
    else if (_connectorInfo.getDatabaseType() == DatabaseType.POSTGRESQL && "DATETIME".equalsIgnoreCase(columnType))
    {
      if (Arrays.asList("GEWAEHRT_AM", "SOLL_DATUM", "IST_DATUM", "WEITERGESCHALTET_DATUM", "DEADLINE_DATE", "CREATEDON").contains(columnMetaData.getColumnName().toUpperCase()))
      {
        return "DATE";
      }
      else
      {
        return "TIMESTAMP";
      }
    }
    else if (MSSQL_BLOBTYPE.equalsIgnoreCase(columnType))
    {
      switch (_connectorInfo.getDatabaseType())
      {
        case POSTGRESQL:
          return "OID";
        case MYSQL:
          return "MEDIUMBLOB";
        case MSSQL:
          return columnType;
        default:
          return "BLOB";
      }
    }
    else
    {
      return super.getColumnType(columnMetaData);
    }
  }
}
