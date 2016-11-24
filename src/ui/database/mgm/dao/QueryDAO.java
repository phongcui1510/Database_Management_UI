package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import ui.database.mgm.model.CombineObject;
import ui.database.mgm.util.ConnectionManager;



public class QueryDAO {

	private static final Logger logger = Logger.getLogger (QueryDAO.class);
	
	public CombineObject executeSelectQuery (String sql) {
		logger.info("Execute select query: " + sql);
		Connection con = ConnectionManager.getConnection();
		CombineObject returnObject = new CombineObject();
		List<String> header = new ArrayList<String>();
		List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
		 try {
			 PreparedStatement ps = con.prepareStatement(sql);
             ResultSet resultSet = ps.executeQuery();
             ResultSetMetaData metaData = resultSet.getMetaData();
             int numberOfColumns = metaData.getColumnCount();
             for(int i = 1; i<= numberOfColumns; i++){
            	 header.add(metaData.getColumnName(i));
             }
             returnObject.setHeader(header);

             while (resultSet.next()){
            	 Map<String, Object> row = new HashMap<String, Object>();
                 for (int i = 1; i <= numberOfColumns; i++){
                     row.put(metaData.getColumnName(i), resultSet.getObject(i));
                 }
                 data.add(row);
             }
             returnObject.setData(data);
             return returnObject;
         }
         catch (Exception f) {
             f.printStackTrace();
         } finally {
        	 try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
         }
		return returnObject;
	}
	
	public int executeUpdateQuery (String sql) {
		logger.info("Execute update query: " + sql);
		Connection con = ConnectionManager.getConnection();
		 try {
			 PreparedStatement ps = con.prepareStatement(sql);
             int i = ps.executeUpdate();
             return i;
         }
         catch (Exception f) {
             f.printStackTrace();
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
