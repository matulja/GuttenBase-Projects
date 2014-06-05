package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.ConnectorInfo;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.tools.schema.DefaultSchemaColumnTypeMapper;

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
      return "TIMESTAMP";
    }
    else if (MSSQL_BLOBTYPE.equalsIgnoreCase(columnType))
    {
      return _connectorInfo.getDatabaseType() == DatabaseType.POSTGRESQL ? "OID" : "BLOB";
    }
    else
    {
      return super.getColumnType(columnMetaData);
    }
  }
}
