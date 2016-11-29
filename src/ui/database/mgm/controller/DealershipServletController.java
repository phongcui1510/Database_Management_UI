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

import ui.database.mgm.dao.DealershipDAO;
import ui.database.mgm.model.Customer;
import ui.database.mgm.model.Dealership;
import ui.database.mgm.model.User;

public class DealershipServletController extends HttpServlet {

	private static final Logger logger = Logger.getLogger (DealershipServletController.class);
	
	private DealershipDAO dealershipDao = new DealershipDAO();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String url = request.getRequestURL().toString();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        if (url.contains("search")) {
        	logger.info("Search dealership");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            Dealership dealership = new Dealership();
            if (id != null && id != "") {
            	dealership.setId(Integer.valueOf(id));
            }
            dealership.setName(name);
            List<Dealership> dealerships = dealershipDao.findDealership(dealership);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(dealerships);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("dealerships", dealerships);
	            request.getRequestDispatcher("/dealership.jsp").forward(request,response);
            }
        } else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	 String name = request.getParameter("name");
             Dealership dealership = new Dealership();
             dealership.setName(name);
             int i = dealershipDao.insertDealership(dealership);
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
        	Dealership dealership = new Dealership();
            dealership.setId(Integer.valueOf(id));
            dealership.setName(name);
            int i = dealershipDao.updateDealership(dealership);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	int i = dealershipDao.deleteDealership(Integer.valueOf(id));
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
