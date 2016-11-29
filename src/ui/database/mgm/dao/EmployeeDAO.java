package ui.database.mgm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import ui.database.mgm.model.Employee;
import ui.database.mgm.util.ConnectionManager;

public class EmployeeDAO {

	private static final Logger logger = Logger.getLogger(EmployeeDAO.class);

    public List<Employee> findEmployee(Employee employee) {
        Connection con = ConnectionManager.getConnection();
        try {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT * FROM employee");
            StringBuffer condition = new StringBuffer();

            if (employee.getId() != null) {
                condition.append("employee_id = " + employee.getId());
            }
            if (employee.getName() != null && employee.getName() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("name like '%" + employee.getName() + "%'");
            }
            if (employee.getAddress() != null && employee.getAddress() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("address like '%" + employee.getName() + "%'");
            }
            if (employee.getEmail() != null && employee.getEmail() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("email like '%" + employee.getEmail() + "%'");
            }
            if (employee.getPhone() != null && employee.getPhone() != "") {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("phone_no like '%" + employee.getPhone() + "%'");
            }
            if (employee.getDealership() != null && employee.getDealership() != 0) {
                if (condition.length() != 0) {
                    condition.append(" and ");
                }
                condition.append("phone_no like '%" + employee.getPhone() + "%'");
            }
            if (condition.length() != 0) {
                sql.append(" where ").append(condition);
            }
            logger.info(sql);
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Employee> employees = new ArrayList<Employee>();
            while (rs.next()) {
            	Employee e = new Employee();
                e.setId(rs.getInt("employee_id"));
                e.setName(rs.getString("name"));
                e.setAddress(rs.getString("address"));
                e.setPhone(rs.getString("phone_no"));
                e.setEmail(rs.getString("email"));
                e.setDealership(rs.getInt("DEALERSHIP_ID"));
                employees.add(e);
            }
            return employees;
        } catch (Exception e) {
            logger.info("Find employees get error with info: " + e);
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
    
    public int insertEmployee (Employee employee) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			String sql = "insert into employee(name, address, phone_no, email, DEALERSHIP_ID) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);  

			ps.setString(1, employee.getName());
			ps.setString(2, employee.getAddress());
			ps.setString(3, employee.getPhone());
			ps.setString(4, employee.getEmail());
			ps.setInt(5, employee.getDealership());

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert employee successfully with info: " + employee);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert employee get error with info: " + e);
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
    
    public int updateEmployee (Employee employee) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("update employee");
			StringBuffer updateClause = new StringBuffer();

            if (employee.getName() != null && employee.getName() != "") {
                updateClause.append("name ='" + employee.getName() + "'");
            }
            if (employee.getAddress() != null && employee.getAddress() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("address ='" + employee.getName() + "'");
            }
            if (employee.getEmail() != null && employee.getEmail() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("email ='" + employee.getEmail() + "'");
            }
            if (employee.getPhone() != null && employee.getPhone() != "") {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("phone_no = '" + employee.getPhone() + "'");
            }
            if (employee.getDealership() != null && employee.getDealership() != 0) {
                if (updateClause.length() != 0) {
                    updateClause.append(", ");
                }
                updateClause.append("dealership_id = " + employee.getDealership() + "");
            }
            if (updateClause.length() != 0) {
                sql.append(" set ").append(updateClause).append(" where employee_id = " + employee.getId());
            }
			PreparedStatement ps = con.prepareStatement(sql.toString());  

			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Insert employee successfully with info: " + employee);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Insert employee get error with info: " + e);
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
    
    public int deleteEmployee (int id) {
    	Connection con = ConnectionManager.getConnection();
		try{  
			StringBuffer sql = new StringBuffer();
			sql.append("delete from employee where employee_id = ?");

			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();  
			if (i>0) {
				logger.info("Delete employee successfully with employee id = " + id);
				return 1;
			}

		} catch (Exception e) {
			logger.info("Delete employee get error with info: " + e);
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
