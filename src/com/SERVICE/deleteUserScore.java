package com.SERVICE;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDao;

/**
 * Servlet implementation class deleteUserScore
 */
@WebServlet("/deleteUserScore")
public class deleteUserScore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteUserScore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String grade_id = request.getParameter("grade_id");
		String stu_grade = request.getParameter("stu_grade");
		String delete = request.getParameter("btn2");
		String save = request.getParameter("save");

		if ("删除".equals(delete)) {
			UserDao userDao = new UserDao();
			boolean deleteScore = userDao.deleteStuGrad(grade_id);
			request.getSession().setAttribute("UploadInfo", "删除成功");
			response.sendRedirect("TMain.jsp");
		} else if ("保存".equals(save)) {
			UserDao userDao1 = new UserDao();
			boolean updateScore = userDao1.updateStuGrad(grade_id, stu_grade);
			request.getSession().setAttribute("UploadInfo", "保存成功");
			response.sendRedirect("TMain.jsp");
		}
	}

}
