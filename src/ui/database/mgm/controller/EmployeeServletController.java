package ui.database.mgm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;

import ui.database.mgm.dao.EmployeeDAO;
import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Employee;
import ui.database.mgm.model.User;

public class EmployeeServletController extends HttpServlet{

	private static final Logger logger = Logger.getLogger (CustomerServletController.class);
	
	private EmployeeDAO EmployeeDAO = new EmployeeDAO();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url = request.getRequestURL().toString();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
		if (url.contains("search")) {
			logger.info("Search customer");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dealership = request.getParameter("dealership");
            Employee employee = new Employee();
            if (id != null && id != "") {
            	employee.setId(Integer.valueOf(id));
            }
            employee.setName(name);
            employee.setAddress(address);
            employee.setPhone(phone);
            employee.setEmail(email);
            if (dealership != null && dealership != "") {
            	employee.setDealership(Integer.valueOf(dealership));
            }
            List<Employee> employees = EmployeeDAO.findEmployee(employee);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(employees);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("employees", employees);
	            request.getRequestDispatcher("/employee.jsp").forward(request,response);
            }
		} else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
			String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dealership = request.getParameter("dealership");
            Employee employee = new Employee();
            employee.setName(name);
            employee.setAddress(address);
            employee.setPhone(phone);
            employee.setEmail(email);
            employee.setDealership(Integer.valueOf(dealership));
            int i = EmployeeDAO.insertEmployee(employee);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
		} else if (url.contains("update") && user.getRole().equalsIgnoreCase("ADMIN")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dealership = request.getParameter("dealership");
            Employee employee = new Employee();
            employee.setId(Integer.valueOf(id));
            employee.setName(name);
            employee.setAddress(address);
            employee.setPhone(phone);
            employee.setEmail(email);
            employee.setDealership(Integer.valueOf(dealership));
            int i = EmployeeDAO.updateEmployee(employee);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
		} else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
			String id = request.getParameter("id");
        	int i = EmployeeDAO.deleteEmployee(Integer.valueOf(id));
        	PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
        	 if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
		}
	}

}
