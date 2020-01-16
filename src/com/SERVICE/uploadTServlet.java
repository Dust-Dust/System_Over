package com.SERVICE;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.UserDao;

@WebServlet(name = "uploadTServlet", urlPatterns = "/uploadTServlet")
@MultipartConfig(location = "E:/Eclipse-WorkSpace/Educational Management System/WebContent/img")
public class uploadTServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		// 获取上传的文件集合
		Collection<Part> parts = request.getParts();
		// 上传单个文件
		if (parts != null && parts.size() > 0) {
			for (Part p : parts) {// 循环处理上传的文件
				// 获取文件名
				String fileName = p.getSubmittedFileName();
				if (fileName == null || "".equals(fileName)) {

				} else {
					String user_name = request.getParameter("userName");
					String user_pass = request.getParameter("userPass");
					String user_nickname = request.getParameter("userNickname");
					String user_date = request.getParameter("userDate");
					String user_sex = request.getParameter("userSex");
					String user_age = request.getParameter("userAge");
					String user_email = request.getParameter("userEmail");
					String head_image = fileName;
					String user_id = request.getParameter("userid");

					UserDao userDao = new UserDao();
					try {
						boolean b = userDao.updateUserInfo(user_name, user_pass, user_nickname, head_image, user_id,user_date,user_sex,user_age,user_email);
						
						request.getSession().setAttribute("UploadInfo", "修改成功");

						response.sendRedirect("TMain.jsp");
						
						// 把文件写到指定路径
						p.write(fileName);

						PrintWriter out = response.getWriter();

						out.flush();
						out.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}