<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
</body>
</html>
<%

	//设置请求的编码格式
	request.setCharacterEncoding("utf-8");

	//获取登录数据	
	session.setAttribute("errInfo", "");

	//获取输入框的值
	String user_num = request.getParameter("username");
	String user_pass = request.getParameter("userpass");
	String user_type = request.getParameter("usertype");
	
	UserDao userDao = new UserDao();
	
	//获取对应账号密码的ID
	String userid = userDao.searchInfo(user_num, user_pass, user_type);
	session.setAttribute("id", userid);

	//判断用户名是否为空
	boolean rsdata = userDao.userExits(user_num);
	
	//调用login函数进行登录并获取身份
	if (rsdata) {
		boolean rsdata1 = userDao.login(user_num, user_pass, user_type);
		if (rsdata1) {
			if (user_type.equals("A")) {
				response.sendRedirect("SMain.jsp");
			} else if (user_type.equals("B")) {
				response.sendRedirect("TMain.jsp");
			} else if (user_type.equals("C")) {
				response.sendRedirect("Main.jsp");
			}
		} else {
			out.print("<script>alert('密码输入错误，或身份选择错误！'); window.location='Login.jsp' </script>");
		}
	} else {
		out.print("<script>alert('用户不存在！'); window.location='Login.jsp' </script>");
	}
%>