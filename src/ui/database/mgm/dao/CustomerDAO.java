/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import ui.database.mgm.model.Customer;
import ui.database.mgm.util.ConnectionManager;

/**
 *
 * @author Phong
 */
public class CustomerDAO {

    private static final Logger logger = Logger.getLogger(CustomerDAO.class);

    public List<Customer> findCustomer(Customer customer) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM customer");
            StringBuffer condition = new StringBuffer();

            if (customer.getId() != null) {
                condition.append("customer_id = " + customer.getId());
            }
            if (customer.getName() != null && customer.getName() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("name like %" + customer.getName() + "%");
            }
            if (customer.getAddress() != null && customer.getAddress() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("address like %" + customer.getName() + "%");
            }
            if (customer.getEmail() != null && customer.getEmail() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("email like %" + customer.getEmail() + "%");
            }
            if (customer.getPhone() != null && customer.getPhone() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("phone like %" + customer.getPhone() + "%");
            }
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Customer> customers = new ArrayList<Customer>();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("customer_id"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone_no"));
                c.setEmail(rs.getString("email"));
                customers.add(c);
            }
            return customers;
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
    
    public int insertCustomer (Customer customer) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into customer(name, address, phone_no, email, customer_type) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, customer.getName());
			ps.setString(2, customer.getAddress());
			ps.setString(3, customer.getPhone());
			ps.setString(4, customer.getEmail());
			ps.setString(5, customer.getType());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert Customer successfully with info: " + customer);
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
    
    public int updateCustomer (Customer customer) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update customer");
			StringBuffer updateClause = new StringBuffer();

            if (customer.getName() != null && customer.getName() != "") {
                updateClause.append("name ='" + customer.getName() + "'");
            }
            if (customer.getAddress() != null && customer.getAddress() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("address ='" + customer.getName() + "'");
            }
            if (customer.getEmail() != null && customer.getEmail() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("email ='" + customer.getEmail() + "'");
            }
            if (customer.getPhone() != null && customer.getPhone() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("phone_no = '" + customer.getPhone() + "'");
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where customer_id = " + customer.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert Customer successfully with info: " + customer);
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
