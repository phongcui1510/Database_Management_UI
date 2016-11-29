package ui.database.mgm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;

import ui.database.mgm.dao.BillingDAO;
import ui.database.mgm.model.Billing;
import ui.database.mgm.model.User;

public class BillingServletController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger (CustomerServletController.class);
	
	private BillingDAO billingDao = new BillingDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        if (url.contains("search")) {
            logger.info("Search customer");
            String id = request.getParameter("id");
            String payment_date = request.getParameter("payment_date");
            String payment_method = request.getParameter("payment_method");
            String sale_id = request.getParameter("sale_id");
            String service_id = request.getParameter("service_id");
            String customer_id = request.getParameter("customer_id");
            String vehicle_id = request.getParameter("vehicle_id");
            Billing billing = new Billing();
            if (id != null && id != "") {
            	billing.setId(Integer.valueOf(id));
            }
            if (payment_date != null && payment_date != "") {
            	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            	Date date = null;
				try {
					date = df.parse(payment_date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	billing.setPayment_date(date);
            }
            if (payment_method != null && payment_method != "") {
            	billing.setPayment_method(payment_method);
            }
            if (service_id != null && service_id != "") {
            	billing.setService_id(Integer.valueOf(service_id));
            }
            if (customer_id != null && customer_id != "") {
            	billing.setCustomer_id(Integer.valueOf(customer_id));
            }
            if (vehicle_id != null && vehicle_id != "") {
            	billing.setVehicle_id(Integer.valueOf(vehicle_id));
            }
            List<Billing> billings = billingDao.findBilling(billing);
            if (url.contains("json")) {
            	response.setContentType("application/json");
            	JSONArray json  = new JSONArray(billings);
            	response.getWriter().write(json.toString());
            } else {
	            request.setAttribute("billings", billings);
	            request.getRequestDispatcher("/billing.jsp").forward(request,response);
            }
        } else if (url.contains("insert") && user.getRole().equalsIgnoreCase("ADMIN")) {
             String payment_date = request.getParameter("payment_date");
             String payment_method = request.getParameter("payment_method");
             String service_id = request.getParameter("service_id");
             String customer_id = request.getParameter("customer_id");
             String vehicle_id = request.getParameter("vehicle_id");
             Billing billing = new Billing();
             if (payment_date != null && payment_date != "") {
             	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
             	Date date = null;
				try {
					date = df.parse(payment_date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
             	billing.setPayment_date(date);
             }
             if (payment_method != null && payment_method != "") {
             	billing.setPayment_method(payment_method);
             }
             if (service_id != null && service_id != "") {
             	billing.setService_id(Integer.valueOf(service_id));
             }
             if (customer_id != null && customer_id != "") {
             	billing.setCustomer_id(Integer.valueOf(customer_id));
             }
             if (vehicle_id != null && vehicle_id != "") {
             	billing.setVehicle_id(Integer.valueOf(vehicle_id));
             }
             int i = billingDao.insertBilling(billing);
             PrintWriter out = response.getWriter();
             response.setContentType("text/plain");
             if (i > 0) {
            	 out.write("success");
             } else {
            	 out.write("fail");
             }
        } else if (url.contains("update") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	 String id = request.getParameter("id");
             String payment_date = request.getParameter("payment_date");
             String payment_method = request.getParameter("payment_method");
             String service_id = request.getParameter("service_id");
             String customer_id = request.getParameter("customer_id");
             String vehicle_id = request.getParameter("vehicle_id");
             Billing billing = new Billing();
             if (payment_date != null && payment_date != "") {
             	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
             	Date date = null;
				try {
					date = df.parse(payment_date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
             	billing.setPayment_date(date);
             }
             if (payment_method != null && payment_method != "") {
             	billing.setPayment_method(payment_method);
             }
             if (service_id != null && service_id != "") {
             	billing.setService_id(Integer.valueOf(service_id));
             }
             if (customer_id != null && customer_id != "") {
             	billing.setCustomer_id(Integer.valueOf(customer_id));
             }
             if (vehicle_id != null && vehicle_id != "") {
             	billing.setVehicle_id(Integer.valueOf(vehicle_id));
             }
             if (id != null && id != "") {
              	billing.setId(Integer.valueOf(id));
              }
            int i = billingDao.updateBilling(billing);
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            if (i > 0) {
           	 out.write("success");
            } else {
           	 out.write("fail");
            }
        } else if (url.contains("delete") && user.getRole().equalsIgnoreCase("ADMIN")) {
        	String id = request.getParameter("id");
        	int i = billingDao.deleteBilling(Integer.valueOf(id));
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
