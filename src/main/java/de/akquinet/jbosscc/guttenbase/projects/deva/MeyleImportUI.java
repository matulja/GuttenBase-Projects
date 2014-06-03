package de.akquinet.jbosscc.guttenbase.projects.deva;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.sql.SQLException;

public class MeyleImportUI extends JFrame
{
  private final MeyleImportDeva _meyleImportDeva;
  private final JFileChooser _fileChooser = new JFileChooser(System.getProperty("user.home"));

  public MeyleImportUI(final MeyleImportDeva meyleImportDeva) throws HeadlessException
  {
    super("Import Meyle Dump");
    _meyleImportDeva = meyleImportDeva;
  }

  public void init()
  {
    JPanel main = new JPanel(new BorderLayout());
    JPanel buttons = new JPanel(new FlowLayout());
    main.add(buttons, BorderLayout.NORTH);

    addFileChoose(buttons);

    addRecreate(buttons);

    addCopy(buttons);

    addUpdateSequence(buttons);

    addUpdateUsers(buttons);

    setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    setContentPane(main);
  }

  public void addUpdateUsers(final JPanel buttons)
  {
    final JButton users = new JButton("Update sequence numbers");
    buttons.add(users);

    users.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent e)
      {
        try
        {
          _meyleImportDeva.updateUsers(MeyleImportDeva.TARGET);
        }
        catch (Exception e1)
        {
          e1.printStackTrace();
        }
      }
    });
  }

  public void addUpdateSequence(final JPanel buttons)
  {
    final JButton sequence = new JButton("Update sequence numbers");
    buttons.add(sequence);

    sequence.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent e)
      {
        try
        {
          _meyleImportDeva.updateSequenceNumbers(MeyleImportDeva.TARGET);
        }
        catch (Exception e1)
        {
          e1.printStackTrace();
        }
      }
    });
  }

  public void addCopy(final JPanel buttons)
  {
    final JButton copy = new JButton("Copy data");
    buttons.add(copy);

    copy.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent e)
      {
        try
        {
          _meyleImportDeva.copy(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);
        }
        catch (Exception e1)
        {
          e1.printStackTrace();
        }
      }
    });
  }

  public void addRecreate(final JPanel buttons)
  {
    final JButton recreate = new JButton("Recreate schema");
    buttons.add(recreate);

    recreate.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent e)
      {
        try
        {
          _meyleImportDeva.dropTables(MeyleImportDeva.TARGET);
          _meyleImportDeva.recreateSchema(MeyleImportDeva.SOURCE, MeyleImportDeva.TARGET);
        }
        catch (SQLException e1)
        {
          e1.printStackTrace();
        }
      }
    });
  }

  public void addFileChoose(final JPanel buttons)
  {
    final JButton choose = new JButton("Choose dump file...");
    buttons.add(choose);

    choose.addActionListener(new ActionListener()
    {
      @Override
      public void actionPerformed(final ActionEvent e)
      {
        if (_fileChooser.showOpenDialog(MeyleImportUI.this) == JFileChooser.APPROVE_OPTION)
        {
          File file = _fileChooser.getSelectedFile();

          try
          {
            _meyleImportDeva.setDumpFile(file);
          }
          catch (Exception e1)
          {
            e1.printStackTrace();
          }
        }
      }
    });
  }

  public void start()
  {
    pack();
    setVisible(true);
  }
}
