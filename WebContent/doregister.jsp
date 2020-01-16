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

String username = request.getParameter("username");
String userpass = request.getParameter("userpass");
String usernum = request.getParameter("usernum");
String userdate = request.getParameter("userdate");
String usersex = request.getParameter("usersex");
String userage = request.getParameter("userage");
String useremail = request.getParameter("useremail");

if(usernum.equals("")){
	out.print("<script>alert('学号为空！'); window.location='Register.jsp' </script>");
}else if(username.equals("")){
	out.print("<script>alert('姓名为空！'); window.location='Register.jsp' </script>");
}else if(userpass.equals("")){
	out.print("<script>alert('密码为空！'); window.location='Register.jsp' </script>");
}else if(userdate.equals("")){
	out.print("<script>alert('出生日期为空！'); window.location='Register.jsp' </script>");
}else if(userage.equals("")){
	out.print("<script>alert('年龄为空！'); window.location='Register.jsp' </script>");
}else if(useremail.equals("")){
	out.print("<script>alert('邮箱为空！'); window.location='Register.jsp' </script>");
}else{
	UserDao userDao = new UserDao();
	boolean rsdata1 = userDao.userExits(usernum);
		if(!rsdata1){
			//注册的身份默认为C
			boolean rsdata =userDao.insertUserInfo(username,userpass,usernum,userdate,usersex,userage,useremail,"C");
			if(rsdata){
				out.print("<script>alert('注册成功！'); window.location='Login.jsp' </script>");
			}
		}else{
			out.print("<script>alert('注册失败！'); window.location='Register.jsp' </script>");
		}
}

%>