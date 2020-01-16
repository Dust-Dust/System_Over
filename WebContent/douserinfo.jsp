<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="com.DAO.UserDao" %>
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

String user_name = request.getParameter("userName1");
String user_pass = request.getParameter("userPass1");
String user_num = request.getParameter("userNum1");
String user_sex = request.getParameter("userSex1");
String user_type = request.getParameter("user_type");

 UserDao userDao = new UserDao();

 //调用添加人员的函数
 boolean ss = userDao.setUserInfo(user_name, user_pass, user_num, user_sex, user_type);
 if(ss){
 	session.setAttribute("setInfo", "保存成功");
 	response.sendRedirect("SMain.jsp");
 }else{
 	session.setAttribute("setInfo", "保存失败");
 	response.sendRedirect("SMain.jsp");
 }
 %>