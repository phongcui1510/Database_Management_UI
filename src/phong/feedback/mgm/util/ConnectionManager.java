package phong.feedback.mgm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static Connection con;

	public static Connection getConnection()
	{
			try
			{
				String url = "jdbc:mysql://localhost:3306/mydb"; 
				// assuming "DataSource" is your DataSource name

				Class.forName("com.mysql.jdbc.Driver");

				try
				{            	
					con = DriverManager.getConnection(url,"root",""); 

					// assuming your SQL Server's	username is "username"               
					// and password is "password"

				}

				catch (SQLException ex)
				{
					ex.printStackTrace();
				}
			}

			catch(ClassNotFoundException e)
			{
				System.out.println(e);
			}

			return con;
		}
}
