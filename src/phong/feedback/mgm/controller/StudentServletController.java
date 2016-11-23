package phong.feedback.mgm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import phong.feedback.mgm.dao.FeedbackDAO;
import phong.feedback.mgm.dao.StudentDAO;
import phong.feedback.mgm.model.Feedback;
import phong.feedback.mgm.model.Student;
import phong.feedback.mgm.model.User;

/**
 * Servlet implementation class StudentServletController
 */
public class StudentServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger logger = Logger.getLogger (StudentServletController.class);
	
	private StudentDAO studentDao = new StudentDAO();
	
	private FeedbackDAO feebackDao = new FeedbackDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		dispatchRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void dispatchRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String url = request.getRequestURL().toString();
		String method = request.getMethod();
		logger.info("Full url: " + url);
		logger.info("Method: " + method);
		String[] str = url.split("/student/");
		logger.info("Extracted url: " + str[0] + "   " + str[1]);
		String[] partialUrl = str[1].split("/");
		if (partialUrl[0].equalsIgnoreCase("feedback")) {
			if (partialUrl[1].equalsIgnoreCase("create") && method.equalsIgnoreCase("get")) {
				request.getRequestDispatcher("/pages/student/feedbackSubmit.jsp").forward(request,response);
			} else if (partialUrl[1].equalsIgnoreCase("create") && method.equalsIgnoreCase("post")) {
				Feedback feedback = extractParam(request);
				int result = feebackDao.insertFeedback(feedback);
				if (result>0) {
					request.setAttribute("msg", "Submit feedback successfully");
					request.getRequestDispatcher("/pages/student/feedbackSubmit.jsp").forward(request,response);
				}
			}
		}
	}
	
//	private void redirectLoginPage(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String error = request.getParameter("errorMsg");
//		String msg = request.getParameter("msg");
//		if (error != null && !error.equalsIgnoreCase("")) {
//			request.setAttribute("errorMsg", error);
//		}
//		if (msg != null && !msg.equalsIgnoreCase("")) {
//			request.setAttribute("msg", msg);
//		}
//		request.getRequestDispatcher("/pages/student/login.jsp").forward(request,response);
//	}
	
	
	private Feedback extractParam(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		Feedback feedback = new Feedback(title, description);
		User user = (User)session.getAttribute("currentUser");
		feedback.setOwner(user.getFirstName() + " " + user.getLastName());
		return feedback;
	}
}
