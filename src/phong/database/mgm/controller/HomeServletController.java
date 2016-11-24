package phong.database.mgm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import phong.database.mgm.dao.QueryDAO;
import phong.database.mgm.model.CombineObject;

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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = request.getRequestURL().toString();
		if (url.contains("home")) {
			response.sendRedirect("home.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String sql = request.getParameter("sql");
		if (sql.toLowerCase().contains("select")) {
			CombineObject result = queryDao.executeSelectQuery(sql);
			request.setAttribute("rs", result);
			request.getRequestDispatcher("/home.jsp").forward(request,response);
		} else {
			int i = queryDao.executeUpdateQuery(sql);
			request.setAttribute("msg", "Execute query done.");
			request.getRequestDispatcher("/home.jsp").forward(request,response);
		}
	}

}
