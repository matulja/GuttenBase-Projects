package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.ConnectorInfo;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;
import de.akquinet.jbosscc.guttenbase.tools.schema.DefaultSchemaColumnTypeMapper;

public class MeyleSchemaColumnTypeMapper extends DefaultSchemaColumnTypeMapper
{
  private ConnectorInfo _connectorInfo;

  public MeyleSchemaColumnTypeMapper(final ConnectorInfo connectorInfo)
  {
    _connectorInfo = connectorInfo;
  }

  @Override
  public String getColumnType(final ColumnMetaData columnMetaData)
  {
    if (columnMetaData.getColumnTypeName().toUpperCase().contains("IDENTITY"))
    {
      return "BIGINT";
    }
    else if (_connectorInfo.getDatabaseType() == DatabaseType.MYSQL && "TIMESTAMP".equalsIgnoreCase(columnMetaData.getColumnTypeName()))
    {
      return "DATETIME";
    }
    else if (_connectorInfo.getDatabaseType() == DatabaseType.POSTGRESQL && "DATETIME".equalsIgnoreCase(columnMetaData.getColumnTypeName()))
    {
      return "TIMESTAMP";
    }
    else if (_connectorInfo.getDatabaseType() == DatabaseType.POSTGRESQL && "IMAGE".equalsIgnoreCase(columnMetaData.getColumnTypeName()))
    {
      return "OID";
    }
    else
    {
      return super.getColumnType(columnMetaData);
    }
  }
}
