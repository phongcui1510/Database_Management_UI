package phong.feedback.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

import phong.feedback.mgm.model.Feedback;
import phong.feedback.mgm.util.ConnectionManager;

public class FeedbackDAO {

private static final Logger logger = Logger.getLogger (FeedbackDAO.class);
	
	public int insertFeedback (Feedback feedback) {
		Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into feedback(title, description, owner, date) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, feedback.getTitle());  
			ps.setString(2, feedback.getDescription());  
			ps.setString(3, feedback.getOwner());
			ps.setDate(4, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert Feedback successfully with info: " + feedback);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert Feedback get error with info: " + e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
}
