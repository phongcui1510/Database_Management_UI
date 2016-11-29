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

import ui.database.mgm.dao.VehicleDAO;
import ui.database.mgm.model.Customer;
import ui.database.mgm.model.User;
import ui.database.mgm.model.Vehicle;

public class VehicleServletController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VehicleDAO vehicleDao = new VehicleDAO();
	
    private static final Logger logger = Logger.getLogger (CustomerServletController.class);
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String url = request.getRequestURL().toString();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        if (url.contains("search")) {
        	logger.info("Search vehicle");
            String id = request.getParameter("id");
            String model = request.getParameter("model");
            String price = request.getParameter("price");
            String year = request.getParameter("year");
            String color = request.getParameter("color");
            Vehicle vehicle = new Vehicle();
            if (id != null && id != "") {
            	vehicle.setId(Integer.valueOf(id));
            }
            vehicle.setModel(model);
            if (price != null && price != "") {
            	vehicle.setPrice(Integer.valueOf(price));
            }
            vehicle.setColor(color);
            if (year != null && year != "") {
            	vehicle.setPrice(Integer.valueOf(year));
            }
            List<Vehicle> vehicles = vehicleDao.findVehicle(vehicle);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(vehicles);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("vehicles", vehicles);
	            request.getRequestDispatcher("/vehicle.jsp").forward(request,response);
            }
        } else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String model = request.getParameter("model");
            String year = request.getParameter("year");
            String color = request.getParameter("color");
            String price = request.getParameter("price");
            Vehicle vehicle = new Vehicle();
            vehicle.setModel(model);
            vehicle.setPrice(Integer.valueOf(price));
            vehicle.setYear(Integer.valueOf(year));
            vehicle.setColor(color);
            int i = vehicleDao.insertVehicle(vehicle);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("update") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	String model = request.getParameter("model");
            String price = request.getParameter("price");
            String year = request.getParameter("year");
            String color = request.getParameter("color");
            Vehicle vehicle = new Vehicle();
            vehicle.setId(Integer.valueOf(id));
            vehicle.setModel(model);
            if (price != null & price != "") {
            	vehicle.setPrice(Integer.valueOf(price));
            }
            if (year != null && year != "") {
            	vehicle.setYear(Integer.valueOf(year));
            }
            vehicle.setColor(color);
            int i = vehicleDao.updateVehicle(vehicle);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	int i = vehicleDao.deleteVehicle(Integer.valueOf(id));
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
