<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String user_num = request.getParameter("user_num");
		String stu_grade = request.getParameter("stu_grade");
		String course_id = request.getParameter("course_id");

		UserDao userDao = new UserDao();

		boolean insertstuscore = userDao.InsertStuScore(user_num, stu_grade, course_id);

		if (insertstuscore) {
	%>
	<script type="text/javascript">
		alert("添加成功！");
		window.location.href = "TMain.jsp";
	</script>
	<%
		}
	%>

</body>
</html>