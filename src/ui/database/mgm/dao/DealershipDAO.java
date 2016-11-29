package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Dealership;
import ui.database.mgm.model.Employee;
import ui.database.mgm.util.ConnectionManager;

public class DealershipDAO {

	private static final Logger logger = Logger.getLogger(EmployeeDAO.class);

    public List<Dealership> findDealership(Dealership dealership) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM dealership");
            StringBuffer condition = new StringBuffer();

            if (dealership.getId() != null) {
                condition.append("dealership_id = " + dealership.getId());
            }
            if (dealership.getName() != null && dealership.getName() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("name like '%" + dealership.getName() + "%'");
            }
            
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Dealership> dealerships = new ArrayList<Dealership>();
            while (rs.next()) {
            	Dealership d = new Dealership();
                d.setId(rs.getInt("dealership_id"));
                d.setName(rs.getString("name"));
                dealerships.add(d);
            }
            return dealerships;
        } catch (Exception e) {
            logger.info("Find dealerships get error with info: " + e);
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
    
    public List<Dealership> findAllDealership() {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM dealership");

            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Dealership> dealerships = new ArrayList<Dealership>();
            while (rs.next()) {
            	Dealership d = new Dealership();
                d.setId(rs.getInt("dealership_id"));
                d.setName(rs.getString("name"));
                dealerships.add(d);
            }
            return dealerships;
        } catch (Exception e) {
            logger.info("Find All dealerships get error with info: " + e);
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
    
    public int insertDealership (Dealership dealership) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into dealership(name) values(?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, dealership.getName());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert dealership successfully with info: " + dealership);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert dealership get error with info: " + e);
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
    
    public int updateDealership (Dealership dealership) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update dealership");
			StringBuffer updateClause = new StringBuffer();

            if (dealership.getName() != null && dealership.getName() != "") {
                updateClause.append("name ='" + dealership.getName() + "'");
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where dealership_id = " + dealership.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert dealership successfully with info: " + dealership);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert dealership get error with info: " + e);
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
    
    public int deleteDealership (int id) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("delete from dealership where dealership_id = ?");

			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Delete dealership successfully with dealership id = " + id);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Delete dealership get error with info: " + e);
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
