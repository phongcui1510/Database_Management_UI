package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Service;
import ui.database.mgm.util.ConnectionManager;

public class ServiceDAO {

	private static final Logger logger = Logger.getLogger(ServiceDAO.class);
	
	public List<Service> findAllService() {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM service");

            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Service> service = new ArrayList<Service>();
            while (rs.next()) {
            	Service d = new Service();
            	d.setId(rs.getInt("service_id"));
            	d.setName(rs.getString("name"));
                d.setProblem_type(rs.getString("PROBLEM_TYPE"));
                service.add(d);
            }
            return service;
        } catch (Exception e) {
            logger.info("Find all service get error with info: " + e);
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
