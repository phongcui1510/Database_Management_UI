package phong.feedback.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import phong.feedback.mgm.model.Billing;
import phong.feedback.mgm.model.CombineObject;
import phong.feedback.mgm.model.Customer;
import phong.feedback.mgm.model.Service;
import phong.feedback.mgm.model.User;
import phong.feedback.mgm.model.Vehicle;
import phong.feedback.mgm.util.ConnectionManager;

public class QueryDAO {

	private static final Logger logger = Logger.getLogger (QueryDAO.class);
	
	public CombineObject execute (String sql) {
		Connection con = ConnectionManager.getConnection();
		try{
			logger.info(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			boolean isSelectQuery = ps.execute(sql);
			if (isSelectQuery) { //resultSet
				logger.info("This is select query");
				ResultSet rs = ps.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int count = rsmd.getColumnCount();
				int i = 1;
				List<String> labels = new ArrayList<String>();
				while (i <= count) {
					String label = rsmd.getColumnLabel(i);
					labels.add(label.toLowerCase());
					i++;
				}
				CombineObject co = new CombineObject();
				co.setShowMsg(true);
				while (rs.next()) {
					co.setSelectQuery(true);
					Vehicle v = null;
					Billing b = null;
					Service s = null;
					Customer c = null;
					if (labels.contains("vehicle_id")) {
						if (v == null) {
							v = new Vehicle();
						}
						v.setVehicle_id(rs.getInt("vehicle_id"));
					} 
					if (labels.contains("model")) {
						if (v == null) {
							v = new Vehicle();
						}
						v.setModel(rs.getString("model"));
					}
					if (labels.contains("vehicle_id")) {
						if (v == null) {
							v = new Vehicle();
						}
						v.setPrice(rs.getString("price"));
					} 
					if (labels.contains("vehicle_id")) {
						if (v == null) {
							v = new Vehicle();
						}
						v.setYear(rs.getString("year"));
					} 
					if (labels.contains("vehicle_id")) {
						if (v == null) {
							v = new Vehicle();
						}
						v.setColor(rs.getString("color"));
					}
					if (v != null) {
						co.getVehicle().add(v);
					}
					if (labels.contains("billing_id")) {
						if (b == null) {
							b = new Billing();
						}
						b.setBilling_id(rs.getInt("billing_id"));
					} 
					if (labels.contains("payment_date")) {
						if (b == null) {
							b = new Billing();
						}
						b.setPayment_date(rs.getDate("payment_date"));
					} 
					if (labels.contains("payment_method")) {
						if (b == null) {
							b = new Billing();
						}
						b.setPayment_method(rs.getString("payment_method"));
					}
					if (b != null) {
						co.getBilling().add(b);
					}
					if (labels.contains("service_id")) {
						if (s == null) {
							s = new Service();
						}
						s.setService_id(rs.getInt("service_id"));
					} 
					if (labels.contains("estimate_time")) {
						if (s == null) {
							s = new Service();
						}
						s.setEstimate_time(rs.getString("estimate_time"));
					} 
					if (labels.contains("estimate_price")) {
						if (s == null) {
							s = new Service();
						}
						s.setEstimate_price(rs.getString("estimate_price"));
					} 
					if (labels.contains("completion_date")) {
						if (s == null) {
							s = new Service();
						}
						s.setCompletion_date(rs.getDate("completion_date"));
					}
					if (s != null) {
						co.getService().add(s);
					}
					if (labels.contains("customer_id")) {
						if (c == null) {
							c = new Customer();
						}
						c.setCustomer_id(rs.getInt("customer_id"));
					} 
					if (labels.contains("name")) {
						if (c == null) {
							c = new Customer();
						}
						c.setName(rs.getString("name"));
					} 
					if (labels.contains("address")) {
						if (c == null) {
							c = new Customer();
						}
						c.setAddress(rs.getString("address"));
					} 
					if (labels.contains("phone_no")) {
						if (c == null) {
							c = new Customer();
						}
						c.setPhone(rs.getString("phone_no"));
					} 
					if (labels.contains("email")) {
						if (c == null) {
							c = new Customer();
						}
						c.setEmail(rs.getString("email"));
					}
					if (c != null) {
						co.getCustomer().add(c);
					}
				}
				return co;
			} else {
				logger.info("This is insert or update query");
				CombineObject o = new CombineObject();
				o.setSelectQuery(false);
				return o;
			}
		} catch (Exception e) {
			logger.info("Execute query get error with info: " + e);
			CombineObject o = new CombineObject();
			o.setErrorMsg(e.getMessage());
			o.setShowMsg(true);
			return o;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public User findUserByUsername (String username) {
		Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "SELECT * FROM user WHERE username = ?";
			logger.info(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = getUserFromResultSet(rs);
				return user;
			}
		} catch (Exception e) {
			logger.error("Find User get error with info: " + e);
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

	private User getUserFromResultSet(ResultSet rs) throws SQLException {
		User user = new User();
		user.setId(Integer.valueOf(rs.getString("id")));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setFirstName(rs.getString("firstName"));
		user.setLastName(rs.getString("lastName"));
		user.setAddress(rs.getString("address"));
		user.setEmail(rs.getString("email"));
		user.setDob(rs.getDate("dob"));
		user.setRole(rs.getString("role"));
		return user;
	}
	
	public List<User> findAllStudent () {
		Connection con = ConnectionManager.getConnection();
		List<User> users = new ArrayList<User>();
		try{  
			String sql = "SELECT * FROM user WHERE role = ?";
			logger.info(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "USER");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = getUserFromResultSet(rs);
				users.add(user);
			}
			return users;
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
