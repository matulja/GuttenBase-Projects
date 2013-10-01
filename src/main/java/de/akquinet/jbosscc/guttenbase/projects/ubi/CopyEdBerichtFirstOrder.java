package de.akquinet.jbosscc.guttenbase.projects.ubi;

import java.util.Comparator;

import de.akquinet.jbosscc.guttenbase.hints.TableOrderHint;
import de.akquinet.jbosscc.guttenbase.mapping.TableOrderComparatorFactory;
import de.akquinet.jbosscc.guttenbase.meta.TableMetaData;

public final class CopyEdBerichtFirstOrder extends TableOrderHint
{
  @Override
  public TableOrderComparatorFactory getValue()
  {
    return new TableOrderComparatorFactory()
    {
      @Override
      public Comparator<TableMetaData> createComparator()
      {
        return new Comparator<TableMetaData>()
        {
          @Override
          public int compare(final TableMetaData t1, final TableMetaData t2)
          {
            if (t1.getTableName().equalsIgnoreCase("EDBERICHT"))
            {
              return -1;
            }
            else if (t2.getTableName().equalsIgnoreCase("EDBERICHT"))
            {
              return 1;
            }
            else
            {
              return t1.compareTo(t2);
            }
          }
        };
      }
    };
  }
}