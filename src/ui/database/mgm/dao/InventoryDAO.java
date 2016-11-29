package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Inventory;
import ui.database.mgm.util.ConnectionManager;

public class InventoryDAO {

	private static final Logger logger = Logger.getLogger(InventoryDAO.class);

    public List<Inventory> findInventory(Inventory inventory) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM inventory");
            StringBuffer condition = new StringBuffer();

            if (inventory.getId() != null) {
                condition.append("inventory_id = " + inventory.getId());
            }
            if (inventory.getName() != null && inventory.getName() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("name like '%" + inventory.getName() + "%'");
            }
            if (inventory.getAddress() != null && inventory.getAddress() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("address like '%" + inventory.getAddress() + "%'");
            }
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Inventory> inventories = new ArrayList<Inventory>();
            while (rs.next()) {
            	Inventory c = new Inventory();
                c.setId(rs.getInt("inventory_id"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                inventories.add(c);
            }
            return inventories;
        } catch (Exception e) {
            logger.info("Find Inventory get error with info: " + e);
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
    
    public int insertInventory (Inventory inventory) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into inventory(name, address) values(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, inventory.getName());
			ps.setString(2, inventory.getAddress());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert inventory successfully with info: " + inventory);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert inventory get error with info: " + e);
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
    
    public int updateInventory (Inventory inventory) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update inventory");
			StringBuffer updateClause = new StringBuffer();

            if (inventory.getName() != null && inventory.getName() != "") {
                updateClause.append("name ='" + inventory.getName() + "'");
            }
            if (inventory.getAddress() != null && inventory.getAddress() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("address ='" + inventory.getAddress() + "'");
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where inventory_id = " + inventory.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert inventory successfully with info: " + inventory);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert inventory get error with info: " + e);
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
    
    public int deleteInventory (int id) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("delete from inventory where inventory_id = ?");

			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Delete inventory successfully with inventory id = " + id);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Delete inventory get error with info: " + e);
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
