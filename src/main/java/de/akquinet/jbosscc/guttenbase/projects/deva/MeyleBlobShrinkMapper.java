package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.export.ExportDumpBlob;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapper;
import de.akquinet.jbosscc.guttenbase.meta.ColumnMetaData;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

public class MeyleBlobShrinkMapper implements ColumnDataMapper
{
  @Override
  public Object map(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData, final Object value)
  {
    final Blob blob = (Blob) value;

    if (blob != null)
    {
      final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(new byte[0]);
      return new ExportDumpBlob(byteArrayInputStream)
      {
        @Override
        public InputStream getBinaryStream() throws SQLException
        {
          return byteArrayInputStream;
        }

        @Override
        public void free() throws SQLException
        {
        }
      };
    }
    else
    {
      return null;
    }
  }

  @Override
  public boolean isApplicable(final ColumnMetaData sourceColumnMetaData, final ColumnMetaData targetColumnMetaData) throws SQLException
  {
    final String sourceColumnName = sourceColumnMetaData.getColumnName().toUpperCase();
    final String targetColumnName = targetColumnMetaData.getColumnName().toUpperCase();

    return sourceColumnName.equals(targetColumnName) && sourceColumnName.equalsIgnoreCase("DATA");
  }
}
