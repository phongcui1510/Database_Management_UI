package ui.database.mgm.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionManager {

	private static Connection con;

	private static Properties properties = new Properties();

	public static Connection getConnection()
	{
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("application.properties");
		try
		{
			properties.load(input);
			String url = properties.getProperty("database.url");
			String username = properties.getProperty("database.username");
			String password = properties.getProperty("database.password");
			String driver = properties.getProperty("database.driver");

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
		} catch(ClassNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return con;
	}
}
