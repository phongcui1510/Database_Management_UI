package ui.database.mgm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import ui.database.mgm.dao.QueryDAO;
import ui.database.mgm.model.CombineObject;
import ui.database.mgm.model.User;


/**
 * Servlet implementation class LoginController
 */
public class HomeServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final QueryDAO queryDao = new QueryDAO();
	
	private static final Logger logger = Logger.getLogger (HomeServletController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("home")) {
			response.sendRedirect("home.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = request.getParameter("sql");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		logger.info("URI: " + request.getRequestURI());
		if (sql.toLowerCase().contains("select")) {
			CombineObject result = queryDao.executeSelectQuery(sql);
			request.setAttribute("rs", result);
			request.setAttribute("msg", "Found " + result.getData().size() + " records.");
			request.getRequestDispatcher("/home.jsp").forward(request,response);
		} else if (user != null && user.getRole().equalsIgnoreCase("admin")) {
			int i = queryDao.executeUpdateQuery(sql);
			request.setAttribute("msg", "Execute query done.");
			request.getRequestDispatcher("/home.jsp").forward(request,response);
		} else {
			request.setAttribute("msg", "You do not have permission to execute this query.");
			request.getRequestDispatcher("/home.jsp").forward(request,response);
		}
	}

}
