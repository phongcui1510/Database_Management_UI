/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import org.json.JSONObject;

import ui.database.mgm.dao.CustomerDAO;
import ui.database.mgm.model.Customer;
import ui.database.mgm.model.User;

/**
 *
 * @author Phong
 */
public class CustomerServletController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CustomerDAO customerDao = new CustomerDAO();
    
    private static final Logger logger = Logger.getLogger (CustomerServletController.class);
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            Customer customer = new Customer();
            if (id != null && id != "") {
            	customer.setId(Integer.valueOf(id));
            }
            customer.setName(name);
            customer.setAddress(address);
            customer.setPhone(phone);
            customer.setEmail(email);
            List<Customer> customers = customerDao.findCustomer(customer);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(customers);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("customers", customers);
	            request.getRequestDispatcher("/customer.jsp").forward(request,response);
            }
        } else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
             String name = request.getParameter("name");
             String address = request.getParameter("address");
             String phone = request.getParameter("phone");
             String email = request.getParameter("email");
             Customer customer = new Customer();
             customer.setName(name);
             customer.setAddress(address);
             customer.setPhone(phone);
             customer.setEmail(email);
             int i = customerDao.insertCustomer(customer);
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
            Customer customer = new Customer();
            customer.setId(Integer.valueOf(id));
            customer.setName(name);
            customer.setAddress(address);
            customer.setPhone(phone);
            customer.setEmail(email);
            int i = customerDao.updateCustomer(customer);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	int i = customerDao.deleteCustomer(Integer.valueOf(id));
        	PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
        	 if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
