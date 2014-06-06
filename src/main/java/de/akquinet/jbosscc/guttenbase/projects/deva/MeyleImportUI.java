package de.akquinet.jbosscc.guttenbase.projects.deva;

import de.akquinet.jbosscc.guttenbase.connector.ConnectorInfo;
import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;
import org.apache.log4j.Logger;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.concurrent.Callable;

public class MeyleImportUI extends JFrame
{
  private static final Logger LOG = Logger.getLogger(MeyleImportDeva.class);

  private final MeyleImportDeva _meyleImportDeva;
  private final JFileChooser _fileChooser = new JFileChooser(System.getProperty("user.home"));
  private JButton _runAll;
  private final MeyleImportTableModel _tableModel = new MeyleImportTableModel();
  private JButton _dropTables;
  private JButton _createSchema;
  private JButton _copy;
  private JButton _sequences;
  private JButton _users;

  public MeyleImportUI(final MeyleImportDeva meyleImportDeva) throws HeadlessException
  {
    super("Import Meyle Dump");
    _meyleImportDeva = meyleImportDeva;
  }

  public void init()
  {
    JPanel main = new JPanel(new BorderLayout());
    JPanel stepwiseActionsPanel = new JPanel(new FlowLayout());
    main.add(stepwiseActionsPanel, BorderLayout.SOUTH);
    JPanel completeActionsPanel = new JPanel(new FlowLayout());
    main.add(completeActionsPanel, BorderLayout.NORTH);

    addFileChoose(completeActionsPanel);
    _runAll = addRunAll(completeActionsPanel);

    _dropTables = addDropTables(stepwiseActionsPanel);
    _createSchema = addCreateSchema(stepwiseActionsPanel);
    _copy = addCopy(stepwiseActionsPanel);
    _sequences = addUpdateSequences(stepwiseActionsPanel);
    _users = addUpdateUser(stepwiseActionsPanel);

    enableActions(false);
    main.add(new JScrollPane(new JTable(_tableModel)), BorderLayout.CENTER);

    setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    setContentPane(main);
  }

  private void addFileChoose(final JPanel buttons)
  {
    addButton("Choose dump file...", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        if (_fileChooser.showOpenDialog(MeyleImportUI.this) == JFileChooser.APPROVE_OPTION)
        {
          File file = _fileChooser.getSelectedFile();

          if (file.exists() && file.isFile() && file.canRead())
          {
            _meyleImportDeva.setDumpFile(file);
            enableActions(true);
            return null;
          }
        }

        enableActions(false);

        return null;
      }
    });
  }

  private JButton addButton(String label, final JPanel buttons, final Callable action)
  {
    final JButton button = new JButton(label);
    buttons.add(button);

    button.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent event)
      {
        try
        {
          action.call();
        }
        catch (Exception e)
        {
          LOG.error("An error occured", e);
          JOptionPane.showMessageDialog(MeyleImportUI.this, "An Error occured!\nSee console for details" + e.toString());
        }
      }
    });

    return button;
  }

  private JButton addRunAll(final JPanel buttons)
  {
    return addButton("Start import", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.dropTables(MeyleImportDeva.TARGET);
        _meyleImportDeva.recreateSchema(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);

        _meyleImportDeva.copy(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);
        _meyleImportDeva.recreateAndUpdateSequences(MeyleImportDeva.TARGET);
        _meyleImportDeva.updateUsers(MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private JButton addDropTables(final JPanel buttons)
  {
    return addButton("Drop tables", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.dropTables(MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private JButton addCreateSchema(final JPanel buttons)
  {
    return addButton("Create schema", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.recreateSchema(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private JButton addCopy(final JPanel buttons)
  {
    return addButton("Copy data", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.copy(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private JButton addUpdateSequences(final JPanel buttons)
  {
    return addButton("Recreate and update sequences", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.recreateAndUpdateSequences(MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private JButton addUpdateUser(final JPanel buttons)
  {
    return addButton("Update users & passwords", buttons, new Callable()
    {
      @Override
      public Object call() throws Exception
      {
        _meyleImportDeva.updateUsers(MeyleImportDeva.TARGET);
        return null;
      }
    });
  }

  private void enableActions(final boolean enable)
  {
    _runAll.setEnabled(enable);

    _createSchema.setEnabled(enable);
    _copy.setEnabled(enable);
    _dropTables.setEnabled(enable);
    _sequences.setEnabled(enable);
    _users.setEnabled(enable);

    if (enable)
    {
      _meyleImportDeva.setupTarget(_tableModel.getConnectorInfo());
    }
  }

  public static void main(String[] args)
  {
    final MeyleImportUI meyleImportUI = new MeyleImportUI(null);
    meyleImportUI.init();
    meyleImportUI.start();
  }

  public void start()
  {
    pack();
    setVisible(true);
  }

  private static class MeyleImportTableModel extends DefaultTableModel
  {
    public MeyleImportTableModel()
    {
      super(new Object[][]{
              {true, "jdbc:postgresql://localhost:5432/meyle-devA", "meyle", "meylenstein", "org.postgresql.Driver", "public", DatabaseType.POSTGRESQL},
              {false, "jdbc:mysql://localhost:3306/deva", "ubiusr", "geheim", "com.mysql.jdbc.Driver", "deva", DatabaseType.MYSQL},
              {false, "jdbc:jtds:sqlserver://172.20.201.71:1433/PDP_PROD;instance=SQLEXPRESS", "PDP-DB-User", "pdp4meyle", "net.sourceforge.jtds.jdbc.Driver", "public", DatabaseType.POSTGRESQL},
              {false, "URL", "Username", "Password", "Driver", "Schema", "DB-Type"}
      }, new Object[]{"", "URL", "Username", "Password", "Driver", "Schema", "DB-Type"});
    }

    public ConnectorInfo getConnectorInfo()
    {
      final int rowCount = getRowCount();

      for (int row = rowCount - 1; row >= 0; row--)
      {
        if (getString(row, 0).equals("true"))
        {
          return new URLConnectorInfoImpl(getString(row, 1), getString(row, 2), getString(row, 3), getString(row, 4), getString(row, 5), DatabaseType.valueOf(getString(row, 6)));
        }
      }

      throw new IllegalStateException("No row selected");
    }

    private String getString(final int row, int column)
    {
      return String.valueOf(getValueAt(row, column));
    }

    @Override
    public boolean isCellEditable(final int row, final int column)
    {
      return column == 0 || row > 2;
    }

    @Override
    public Class<?> getColumnClass(final int columnIndex)
    {
      switch (columnIndex)
      {
        case 0:
          return Boolean.class;

        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
          return String.class;

        case 6:
          return DatabaseType.class;

        default:
          throw new IllegalStateException("Unknown column: " + columnIndex);
      }
    }
  }
}
