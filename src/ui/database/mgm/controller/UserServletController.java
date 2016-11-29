package ui.database.mgm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import ui.database.mgm.dao.CustomerDAO;
import ui.database.mgm.dao.DealershipDAO;
import ui.database.mgm.dao.ServiceDAO;
import ui.database.mgm.dao.UserDAO;
import ui.database.mgm.dao.VehicleDAO;
import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Dealership;
import ui.database.mgm.model.Service;
import ui.database.mgm.model.User;
import ui.database.mgm.model.Vehicle;

public class UserServletController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger (UserServletController.class);
	
	private UserDAO userDao = new UserDAO();
	
	private ServiceDAO serviceDao = new ServiceDAO();
	
	private VehicleDAO vehicleDao = new VehicleDAO();
	
	private CustomerDAO customerDao = new CustomerDAO();
	
	private DealershipDAO dealershipDao = new DealershipDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI();
		logger.info("uri : " + uri);
		if (url.contains("login")) {
			resp.sendRedirect("login.jsp");
		} else if (url.contains("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("login.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userDao.findUserByUsernameAndPassword(username, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			List<Dealership> dealerships = dealershipDao.findAllDealership();
			List<Service> services = serviceDao.findAllService();
			List<Customer> customers = customerDao.findAllCustomer();
			List<Vehicle> vehicles = vehicleDao.findAllVehicle();
			request.setAttribute("dealerships", dealerships);
			request.setAttribute("services", services);
			request.setAttribute("customers", customers);
			request.setAttribute("vehicles", vehicles);
			request.getRequestDispatcher("home.jsp").forward(request,response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	
}
