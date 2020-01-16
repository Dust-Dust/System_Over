package com.SERVICE;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;

/**
 * Servlet implementation class logindealServlet
 */
@WebServlet("/logindealServlet")
public class logindealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logindealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//���ñ����ʽ
		  request.setCharacterEncoding("utf-8");
		  HttpSession session =  request.getSession();
		//��ȡ��¼����
		  request.getSession().setAttribute("errInfo", "");
		  String user_name = request.getParameter("username");
		  String user_pass = request.getParameter("userpass");
		  String user_type = request.getParameter("usertype");
		  
		/**
		 *1.��ȷ���ݴ���˭
		 *2.����˭�Ķ���
		 *3.���ö�����ķ���
		 *4.����ֵ
		 **/
		  try {
			  	UserDao userDao = new UserDao();
				String userid = userDao.searchInfo(user_name, user_pass,user_type);
				session.setAttribute("id", userid);
				
				String code=(String)request.getSession().getAttribute("Code");

				boolean rsdata =userDao.userExits(user_name);
				if(user_name.equals("")) {
					response.sendRedirect("Login.jsp");
					session.setAttribute("errorInfo", "学号为空");
				}else if(user_pass.equals("")) {
					response.sendRedirect("Login.jsp");
					session.setAttribute("errorInfo", "密码为空");
				}else if(rsdata){
					boolean rsdata1 = userDao.login(user_name, user_pass,user_type);
						if(rsdata1){
							if(user_type.equals("A")){
								response.sendRedirect("SMain.jsp");
							}else if(user_type.equals("B")){
								response.sendRedirect("TMain.jsp");
							}else if(user_type.equals("C")){
								response.sendRedirect("Main.jsp");
							}
						}else{
							session.setAttribute("errorInfo", "学号或密码错误");
							response.sendRedirect("Login.jsp");
						}	
				}else{
					response.sendRedirect("Login.jsp");
					session.setAttribute("errorInfo", "学号不存在");
				}
					
		  } catch (Exception e) {
			// TODO: handle exception
		}
	}
}
