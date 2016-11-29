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

import ui.database.mgm.dao.InventoryDAO;
import ui.database.mgm.model.Inventory;
import ui.database.mgm.model.User;

public class InventoryServletController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger (InventoryServletController.class);
	
	private InventoryDAO inventoryDao = new InventoryDAO();
	 
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
        	logger.info("Search inventory");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            Inventory inventory = new Inventory();
            if (id != null && id != "") {
            	inventory.setId(Integer.valueOf(id));
            }
            inventory.setName(name);
            inventory.setAddress(address);
            List<Inventory> inventories = inventoryDao.findInventory(inventory);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(inventories);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("inventories", inventories);
	            request.getRequestDispatcher("/inventory.jsp").forward(request,response);
            }
        } else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String name = request.getParameter("name");
            String address = request.getParameter("address");
            Inventory inventory = new Inventory();
            inventory.setName(name);
            inventory.setAddress(address);
            int i = inventoryDao.insertInventory(inventory);
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
            Inventory inventory = new Inventory();
            inventory.setId(Integer.valueOf(id));
            inventory.setName(name);
            inventory.setAddress(address);
            int i = inventoryDao.updateInventory(inventory);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	int i = inventoryDao.deleteInventory(Integer.valueOf(id));
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
