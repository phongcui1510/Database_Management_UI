package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Billing;
import ui.database.mgm.util.ConnectionManager;

public class BillingDAO {

	private static final Logger logger = Logger.getLogger(BillingDAO.class);

    public List<Billing> findBilling(Billing billing) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT b.*, c.CUSTOMER_ID, c.NAME as customer_name, v.*, s.SERVICE_ID, s.NAME as service_name FROM billing b INNER JOIN customer c ON b.CUSTOMER_ID = c.CUSTOMER_ID "
						+ "INNER JOIN service s on s.SERVICE_ID = b.SERVICE_ID "
						+ "INNER JOIN vehicle v on v.VEHICLE_ID = b.VEHICLE_ID");
            StringBuffer condition = new StringBuffer();

            if (billing.getId() != null) {
                condition.append("billing_id = " + billing.getId());
            }
            if (billing.getPayment_date() != null) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                condition.append("b.payment_date >= '" + df.format(billing.getPayment_date()) + " 00:00:00' and b.payment_date <= '" + df.format(billing.getPayment_date()) + " 23:59:59'");
            }
            if (billing.getPayment_method() != null && billing.getPayment_method() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("b.payment_method like '%" + billing.getPayment_method() + "%'");
            }
            if (billing.getSale_id() != null && billing.getSale_id() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("b.sale_id = " + billing.getSale_id());
            }
            if (billing.getService_id() != null && billing.getService_id() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("b.service_id = " + billing.getService_id());
            }
            if (billing.getService_id() != null && billing.getService_id() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("b.vehicle_id = " + billing.getVehicle_id());
            }
            if (billing.getCustomer_id() != null && billing.getCustomer_id() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("b.customer_id = " + billing.getCustomer_id());
            }
            
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Billing> billings = new ArrayList<Billing>();
            while (rs.next()) {
            	Billing c = new Billing();
                c.setId(rs.getInt("billing_id"));
                c.setPayment_date(rs.getDate("payment_date"));
                c.setPayment_method(rs.getString("payment_method"));
                c.setSale_id(rs.getInt("sale_id"));
                c.setService_id(rs.getInt("service_id"));
                c.setVehicle_id(rs.getInt("vehicle_id"));
                c.setCustomer_id(rs.getInt("customer_id"));
                c.setCustomer_name(rs.getString("customer_name"));
                c.setService_name(rs.getString("service_name"));
                c.setVehicle_model(rs.getString("model"));
                billings.add(c);
            }
            return billings;
        } catch (Exception e) {
            logger.info("Find billing get error with info: " + e);
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
    
    public int insertBilling (Billing billing) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into billing(payment_date, payment_method, customer_id, service_id, vehicle_id) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setDate(1, new Date(billing.getPayment_date().getTime()));
			ps.setString(2, billing.getPayment_method());
			ps.setInt(3, billing.getCustomer_id());
			ps.setInt(4, billing.getService_id());
//			ps.setInt(5, billing.getSale_id());
			ps.setInt(5, billing.getVehicle_id());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert billing successfully with info: " + billing);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert billing get error with info: " + e);
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
    
    public int updateBilling (Billing billing) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update billing");
			StringBuffer updateClause = new StringBuffer();

            if (billing.getPayment_date() != null) {
            	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                updateClause.append("payment_date = '" + df.format(billing.getPayment_date()) + "'");
            }
            if (billing.getPayment_method() != null && billing.getPayment_method() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("payment_method ='" + billing.getPayment_method() + "'");
            }
            if (billing.getSale_id() != null && billing.getSale_id() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("sale_id =" + billing.getSale_id());
            }
            if (billing.getService_id() != null && billing.getService_id() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("service_id = " + billing.getService_id());
            }
            if (billing.getVehicle_id() != null && billing.getVehicle_id() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("vehicle_id = " + billing.getVehicle_id());
            }
            if (billing.getCustomer_id() != null && billing.getCustomer_id() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("customer_id = " + billing.getCustomer_id());
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where billing_id = " + billing.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Update billing successfully with info: " + billing);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Update billing get error with info: " + e);
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
    
    public int deleteBilling (int id) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("delete from billing where billing_id = ?");

			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Delete billing successfully with billing id = " + id);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Delete billing get error with info: " + e);
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
