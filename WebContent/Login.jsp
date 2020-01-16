<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>教务管理系统登录界面</title>
<style type="text/css">
#big_box {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-background-size: cover;
	background-position: center 0;
}

.big_box {
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.8;
	width: 100%;
	position: absolute;
	background-attachment: fixed;
	background-image: url(./img/timg.png);
}

/* 登录框学号输入框样式 */
#username {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	color: white;
	outline: none
}

/* 登录框密码输入框样式 */
#userpass {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

/* 登录框验证码输入框样式 */
#yanzhengCode {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#login_box {
	border-radius: 5px;
	background-color: rgba(2, 230, 255, 0.1);
	position: relative;
	left: 20%;
	top: 8%;
}

/*登录按钮设置*/
#LoginButton {
	background-color: rgba(0, 170, 255, 0.5);
	border-radius: 5px;
	border: 0;
	cursor: pointer;
	color: white;
	width: 150px;
	height: 40px;
}

/*登录按钮设置移动变色*/
#LoginButton:hover {
	background-color: #3f9aea;
}

/*注册按钮设置*/
#RegisterButton {
	background-color: rgba(188, 188, 188, 0.5);
	border-radius: 5px;
	border: 0;
	cursor: pointer;
	color: white;
	width: 150px;
	height: 40px;
}

/*注册按钮设置移动变色*/
#RegisterButton:hover {
	background-color: #a6a6a6;
}

#RegisterButton_r {
	background-color: rgba(0, 170, 255, 0.5);
	border-radius: 5px;
	border: 0;
	cursor: pointer;
	color: white;
	width: 150px;
	height: 40px;
}

#RegisterButton_r:hover {
	background-color: #3f9aea;
}

#BackButton_r {
	background-color: rgba(188, 188, 188, 0.5);
	border-radius: 5px;
	border: 0;
	cursor: pointer;
	color: white;
	width: 150px;
	height: 40px;
}

#BackButton_r:hover {
	background-color: #a6a6a6;
}

#register_box {
	border-radius: 5px;
	background-color: rgba(2, 230, 255, 0.1);
	position: relative;
	left: 20%;
	top: 8%;
}

#usernum_r {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#username_r {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#userpass_r {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#userdate {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#useremail {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

#userage {
	border-bottom: white 1px solid;
	border-left-width: 0px;
	border-right-width: 0px;
	border-top-width: 0px;
	background-color: transparent;
	outline: none color: white;
}

/* 设置输入框字体颜色 */
input::-webkit-input-placeholder {
	color: white;
}

date::-webkit-datetime-placeholder {
	color: white;
}
</style>

<script>
	// 设置登录框和输入框渐变效果
	$(document).ready(function() {
		// 登录框和输入框默认隐藏
		$("#register_box").hide();
		$("#login_box").hide();

		//第一次加载界面登录框自动渐入 
		$("#login_box").fadeIn("slow");

		//点击注册按钮，登录框渐出，注册框渐入 
		$("#RegisterButton").click(function() {
			document.getElementById("login_box").style.display = "none";
			$("#register_box").fadeIn("slow");
		})

		// 点击返回按钮，注册框渐出，登录框渐入
		$("#BackButton_r").click(function() {
			document.getElementById("register_box").style.display = "none";
			$("#login_box").fadeIn("slow");
		})
	})
</script>

</head>
<body>
	<!--整体盒子-->
	<div id="big_box" class="big_box" style="width: 100%; height: 840px;">
		<!--中间登录盒子-->
		<div id="login_box" style="width: 60%; height: 450px;">
			<!--登录小盒子-->
			<div
				style="width: 100%; height: 20%; margin-top: 10px; text-align: center;">
				<hr
					style="width: 20%; float: left; margin-top: 45px; color: grey; margin-right: 5%; margin-left: 12%;" />
				<h1
					style="float: left; font-weight: 400; text-align: center; color: white;">教务管理系统登录</h1>
				<hr
					style="width: 20%; float: left; margin-top: 45px; color: grey; margin-left: 5%;" />
			</div>
			<form action="logindealServlet" method="post">
				<!--登录输入框小盒子-->
				<div style="width: 100%; height: 80%; margin: 0 auto;">
					<table
						style="margin: 0 auto; text-align: center; margin-top: 10px;">
						<!--学号输入框-->
						<tr>
							<td><input type="text" name="username" id="username"
								style="width: 300px; height: 30px;" placeholder="学号" /></td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>

						<!--密码输入框-->
						<tr>
							<td><input type="password" name="userpass" id="userpass"
								style="width: 300px; height: 30px;" placeholder="密码" /></td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>

						
						<!--选择身份-->
						<tr>
							<td><input style="font-weight: 600;" type="radio" value="C"
								name="usertype" /><span style="color: white;">&nbsp;学生&nbsp;</span>
								<input style="font-weight: 600; margin-left: 40px;" type="radio"
								value="B" name="usertype" /><span style="color: white;">&nbsp;教师&nbsp;</span>
								<input style="font-weight: 600; margin-left: 40px;" type="radio"
								value="A" name="usertype" /><span style="color: white;">&nbsp;管理员&nbsp;</span></td>
						</tr>
						<tr style="width: 20px; height: 15px;"></tr>

						<tr style="width: 20px; height: 15px;">
							<td colspan="2">
								<%
									String aa = (String) session.getAttribute("errorInfo");
									if ("".equals(aa) || "null".equals(aa) || aa == null) {
										aa = "";
									}
								%> <font id="error" color="red"
								style="float: right; font-family: '华文行楷'"> <%=aa%>
							</font>
							</td>
						</tr>
						<!--登录注册按钮-->
						<tr>
							<td style="text-align: center;"><input type="submit"
								name="submit" id="LoginButton" value="登录" /> <input
								type="button" name="button3" id="RegisterButton" value="注册"
								style="margin-left: 30px;" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<!--注册框-->
		<div id="register_box" style="width: 60%; height: 650px;">
			<!--登录小盒子-->
			<div
				style="width: 100%; height: 20%; margin-top: 10px; text-align: center;">
				<hr
					style="width: 20%; float: left; margin-top: 45px; color: grey; margin-right: 5%; margin-left: 21%;" />
				<h1
					style="float: left; font-weight: 400; text-align: center; color: white;">注册</h1>
				<hr
					style="width: 20%; float: left; margin-top: 45px; color: grey; margin-left: 5%;" />
			</div>
			<form action="doregister.jsp" method="post">
				<div style="width: 100%; height: 80%; margin: 0 auto;">
					<table
						style="margin: 0 auto; margin-top: -30px; text-align: center;">
						<tr>
							<td><input type="text" name="usernum_r" id="usernum_r"
								style="width: 300px; height: 30px;" placeholder="学号" /></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="text" name="username_r" id="username_r"
								style="width: 300px; height: 30px;" placeholder="姓名" /></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="password" name="userpass_r" id="userpass_r"
								style="width: 300px; height: 30px;" placeholder="密码" /></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="date" name="userdate" id="userdate"
								style="width: 300px; height: 30px; font-size: 14px; color: white;"
								placeholder="出生日期" /></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="radio" value="男" name="usersex" /><span
								style="color: white; font-size: 14px;">&nbsp;男&nbsp;</span> <input
								type="radio" value="女" name="usersex" style="margin-left: 50px;" /><span
								style="color: white; font-size: 14px;">&nbsp;女&nbsp; </span></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="number" name="userage" id="userage"
								style="width: 300px; height: 30px; border-radius: 5px;" min="18"
								max="60" placeholder="年龄" /></td>
						</tr>
						<tr style="width: 20px; height: 20px;"></tr>
						<tr>
							<td><input type="text" name="useremail" id="useremail"
								style="width: 300px; height: 30px; border-radius: 5px;"
								placeholder="邮箱" /></td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>
						<tr>
							<td style="text-align: center;"><input type="submit"
								name="submit" id="RegisterButton_r" value="注册" /> <input
								type="button" name="button3" id="BackButton_r" value="返回"
								style="margin-left: 30px;" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<!-- 导入全局样式：跟随鼠标的特效线 -->
	<!-- color：颜色，opacity：不透明度，count：线条数量 -->
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"
		color="0,0,205" opacity='1' count="188"></script>
</body>
</html>

<%
	session.setAttribute("errorInfo", "");
%>