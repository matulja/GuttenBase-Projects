package de.akquinet.jbosscc.guttenbase.projects.deva;

import java.io.File;
import java.io.InputStream;

import de.akquinet.jbosscc.guttenbase.connector.DatabaseType;
import de.akquinet.jbosscc.guttenbase.connector.impl.URLConnectorInfoImpl;
import de.akquinet.jbosscc.guttenbase.utils.Util;

public class H2ConnectionInfo extends URLConnectorInfoImpl {
  private static final long serialVersionUID = 1L;

  public static final File DB_DIRECTORY = new File("target/db");
  public static final byte[] IMAGE = loadImage();

  public H2ConnectionInfo() {
    super("jdbc:h2:" + DB_DIRECTORY + "/h2" + System.currentTimeMillis(), "sa", "sa", "org.h2.Driver", "", DatabaseType.H2DB);
  }

  private static byte[] loadImage() {
    try {
      final InputStream stream = Util.getResourceAsStream("/deva/test.gif");

      final int available = stream.available();
      final byte[] buf = new byte[available];

      stream.read(buf);

      return buf;
    } catch (final Exception e) {
      throw new RuntimeException(e);
    }
  }
}
