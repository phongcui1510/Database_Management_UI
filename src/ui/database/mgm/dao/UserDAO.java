package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import ui.database.mgm.model.User;
import ui.database.mgm.util.ConnectionManager;

public class UserDAO {

private static final Logger logger = Logger.getLogger (UserDAO.class);
	
	public User findUserByUsernameAndPassword (String username, String password) {
		Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "SELECT * FROM user WHERE username = ? and password = ?";
			logger.info(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				return user;
			}
		} catch (Exception e) {
			logger.info("Find User get error with info: " + e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
