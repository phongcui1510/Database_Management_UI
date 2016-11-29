package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Vehicle;
import ui.database.mgm.util.ConnectionManager;

public class VehicleDAO {

	private static final Logger logger = Logger.getLogger(VehicleDAO.class);

    public List<Vehicle> findVehicle(Vehicle vehicle) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM vehicle");
            StringBuffer condition = new StringBuffer();

            if (vehicle.getId() != null) {
                condition.append("vehicle_id = " + vehicle.getId());
            }
            if (vehicle.getModel() != null && vehicle.getModel() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("model like '%" + vehicle.getModel() + "%'");
            }
            if (vehicle.getPrice() != null && vehicle.getPrice() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("price = " + vehicle.getPrice());
            }
            if (vehicle.getYear() != null && vehicle.getYear() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("year = " + vehicle.getYear());
            }
            if (vehicle.getColor() != null && vehicle.getColor() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("color like '%" + vehicle.getColor() + "%'");
            }
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Vehicle> vehicles = new ArrayList<Vehicle>();
            while (rs.next()) {
            	Vehicle c = new Vehicle();
                c.setId(rs.getInt("vehicle_id"));
                c.setModel(rs.getString("model"));
                c.setPrice(rs.getInt("price"));
                c.setYear(rs.getInt("year"));
                c.setColor(rs.getString("color"));
                vehicles.add(c);
            }
            return vehicles;
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
    
    public int insertVehicle (Vehicle vehicle) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into vehicle(model, price, year, color) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, vehicle.getModel());
			ps.setInt(2, vehicle.getPrice());
			ps.setInt(3, vehicle.getYear());
			ps.setString(4, vehicle.getColor());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert vehicle successfully with info: " + vehicle);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert vehicle get error with info: " + e);
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
    
    public int updateVehicle (Vehicle vehicle) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update vehicle");
			StringBuffer updateClause = new StringBuffer();

            if (vehicle.getModel() != null && vehicle.getModel() != "") {
                updateClause.append("name ='" + vehicle.getModel() + "'");
            }
            if (vehicle.getPrice() != null && vehicle.getPrice() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("price =" + vehicle.getPrice());
            }
            if (vehicle.getYear() != null && vehicle.getYear() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("email =" + vehicle.getYear());
            }
            if (vehicle.getColor() != null && vehicle.getColor() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("color = '" + vehicle.getColor() + "'");
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where vehicle_id = " + vehicle.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert vehicle successfully with info: " + vehicle);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert vehicle get error with info: " + e);
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
    
    public int deleteVehicle (int id) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("delete from vehicle where vehicle_id = ?");

			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Delete vehicle successfully with vehicle id = " + id);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Delete vehicle get error with info: " + e);
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
