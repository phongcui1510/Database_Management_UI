package ui.database.mgm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import ui.database.mgm.model.User;

public class UserServletController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger (UserServletController.class);

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
			resp.sendRedirect("home.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			request.getRequestDispatcher("home.jsp").forward(request,response);
		}
	}

	
}
