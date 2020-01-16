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
	session.setAttribute("dayInfo", "");

	//获取输入框的值
	String user_id = request.getParameter("userId1");
	String name = request.getParameter("courseName");
	String course_time = request.getParameter("courseTime");
	String course_day = request.getParameter("courseDay");

	UserDao userDao = new UserDao();

	//判断周几
	if (course_day.equals("1")) {
		boolean day = userDao.setCourseDay1(user_id, course_time, name);
		response.sendRedirect("SMain.jsp");
	} else if (course_day.equals("2")) {
		boolean day = userDao.setCourseDay2(user_id, course_time, name);
		response.sendRedirect("SMain.jsp");
	} else if (course_day.equals("3")) {
		boolean day = userDao.setCourseDay3(user_id, course_time, name);
		response.sendRedirect("SMain.jsp");
	} else if (course_day.equals("4")) {
		boolean day = userDao.setCourseDay4(user_id, course_time, name);
		response.sendRedirect("SMain.jsp");
	} else if (course_day.equals("5")) {
		boolean day = userDao.setCourseDay5(user_id, course_time, name);
		response.sendRedirect("SMain.jsp");
	} else if (user_id.equals("")) {
		out.print("<script>alert('学生编号不能为空'); window.location='SMain.jsp' </script>");
	} else if (name.equals("")) {
		out.print("<script>alert('课程名称不能为空'); window.location='SMain.jsp' </script>");
	} else if (course_time.equals("")) {
		out.print("<script>alert('课程节数不能为空'); window.location='SMain.jsp' </script>");
	} else if (course_day.equals("")) {
		out.print("<script>alert('课程周几不能为空'); window.location='SMain.jsp' </script>");
	}
%>