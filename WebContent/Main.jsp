<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>教务管理系统—学生</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

/*保存按钮设置*/
#baocunb {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
	margin-left: 10px;
}

/*保存按钮设置移动变色*/
#baocunb:hover {
	background-color: #ECF5FF;
}

/*重置按钮设置*/
#chongzhib {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #D2E9FF;
	cursor: pointer;
	margin-left: 10px;
}

/*重置按钮设置移动变色*/
#chongzhib:hover {
	background-color: #ECF5FF;
}

/*竖线*/
.centerdiv {
	float: left;
	width: 50px;
	margin-top: 6px;
	border-right: 1.5px solid darkgrey;
	padding-bottom: 450px;
	margin-bottom: 450px;
}

#div1:hover {
	background-color: rgba(0, 0, 0, 0.4);
}
#div2:hover {
	background-color: rgba(0, 0, 0, 0.4);
}
#div3:hover {
	background-color: rgba(0, 0, 0, 0.4);
}
#div4:hover {
	background-color: rgba(0, 0, 0, 0.4);
}
</style>
</head>
<script type="text/javascript">
		<%String asd = (String) session.getAttribute("UploadInfo");

			if (asd == null || "".equals(asd) || "null".equals(asd)) {

			} else {
				session.setAttribute("UploadInfo", "");
			}%>
		var as = "<%=asd%>";
	if (as == "" || as == null || as == "null") {

	} else {
		alert(as);
	};

	<!--设置个人信息跳转和颜色变化-->
	function lookUser() {
		document.getElementById("Class").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0.4);";
		document.getElementById("div2").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div3").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div4").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
	};

	<!--设置查询课表跳转和颜色变化-->
	function lookClass() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div2").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div3").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0.4);";
		document.getElementById("div4").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";

	};

	<!--设置查询分数跳转和颜色变化-->
	function lookScore() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Class").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div2").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0.4);";
		document.getElementById("div3").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div4").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
	};

	<!--设置修改信息跳转和颜色变化-->
	function updateUserInfo() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Class").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("div1").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div2").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div3").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div4").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0.4);";
	};

	<!--设置验证输入框是否为空-->
	function checkInfo() {
		var userName = document.getElementById("userName").value;
		var userPass = document.getElementById("userPass").value;
		var userNickname = document.getElementById("userNickname").value;
		var head_image = document.getElementById("head_image").value;
		document.getElementById("userid").value =
<%=session.getAttribute("id")%>
	;

		var head_image = document.getElementById("userid").value;

		if (userName == null || userName == "") {
			alert("用户名为空,请重新输入！");
			return false;
		}
		if (userPass == null || userPass == "") {
			alert("密码为空,请重新输入！");
			return false;
		}
		if (userNickname == null || userNickname == "") {
			alert("昵称为空,请重新输入！");
			return false;
		}
		if (head_image == null || head_image == "") {
			alert("图像为空,请重新输入！");
			return false;
		}
	}
</script>

<script>
	$(document).ready(function() {
		$("#div1").click(function() {
			$("#User").fadeIn("slow");
		})
		$("#div2").click(function() {
			$("#Score").fadeIn("slow");
		})
		$("#div3").click(function() {
			$("#Class").fadeIn("slow");
		})
		$("#div4").click(function() {
			$("#SetUser").fadeIn("slow");
		})

	})
</script>

<body>
	<!--大盒子-->
	<div id="big_box" style="background-color: rgba(0, 0, 0, 0.1);">
		<!--顶端盒子-->
		<%
			UserDao userDao0 = new UserDao();
			ResultSet rs0 = userDao0.getUserInfo((String) session.getAttribute("id"));
			if (rs0.next()) {

			}
		%>
		<div
			style="width: 100%; height: 95px; background-color: rgba(0, 0, 127, 0.7);">
			<h1
				style="font-family: '华文行楷'; color: white; float: left; font-size: 36px; margin-left: 50px; margin-top: 30px;">
				教务管理系统</h1>
			<h1
				style="font-family: '华文行楷'; color: white; float: right; margin-top: 32px; font-size: 24px;">
				欢迎学生,<%=rs0.getString("user_name")%></h1>
			<h1
				style="font-family: '华文行楷'; font-size: 20px; margin-top: 5px; color: white; cursor: pointer; text-decoration: underline; position: absolute; right: 10px;"
				onclick="window.location.href='Login.jsp'">退出系统</h1>
		</div>
		<!--左边功能盒子-->
		<div
			style="width: 12%; height: 655px; background-color: rgba(50, 50, 50, 0.6); float: left;">
			<!--//功能-->
			<div id="div1" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="lookUser()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					个人信息</span>
			</div>
			<div id="div2" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="lookScore()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					查询成绩</span>
			</div>
			<div id="div3" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="lookClass()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					查询课表</span>
			</div>
			<div id="div4" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="updateUserInfo()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					修改信息</span>
			</div>
		</div>
		<!--右边功能盒子-->
		<div
			style="width: 88%; height: 655px; float: left;">

			<!--个人信息界面-->
			<div id="User"
				style="width: 100%; height: 100%; float: left; margin-top: 2px">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">个人信息</span>
				</div>

				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey; padding-top: 0.5px">
							<%
								UserDao userDao1 = new UserDao();
								ResultSet rs1 = userDao1.getUserInfo((String) session.getAttribute("id"));

								while (rs1.next()) {
							%>
							<div>
								<img src="img/<%=rs1.getString("user_title")%>"
									style="height: 400px; width: 300px; margin-top: 32px; margin-left: 200px; float: left;" />
							</div>
							<div class="centerdiv"></div>
							<div
								style="float: left; margin-left: 30px; margin-top: 25px; font-size: 24px">
								<span>学号：</span><span><%=rs1.getString("user_num")%></span><br />
								<br /> <span>姓名：</span><span><%=rs1.getString("user_name")%></span><br />
								<br /> <span>昵称：</span><span><%=rs1.getString("user_nickname")%></span><br />
								<br /> <span>出生日期：</span><span><%=rs1.getString("user_birthdate")%></span><br />
								<br /> <span>性别：</span><span><%=rs1.getString("user_sex")%></span><br />
								<br /> <span>年龄：</span><span><%=rs1.getString("user_age")%></span><br />
								<br /> <span>邮箱：</span><span><%=rs1.getString("user_email")%></span><br />

								<br />
							</div>

							<%
								}
								rs1.close();
							%>
						</div>
					</div>
				</div>
			</div>

			<!--查询分数界面-->
			<div id="Score"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">查询成绩</span>
				</div>

				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%">
								<table border="1" cellspacing="0" cellpadding="20"
									style="width: 100%; height: 100%;">
									<tr>
										<td>序号</td>
										<td>姓名</td>
										<td>学号</td>
										<td>课程名</td>
										<td>课程学分</td>
										<td>成绩</td>

									</tr>
									<%
										UserDao userDao2 = new UserDao();
										ResultSet rs2 = userDao2.getUserScore((String) session.getAttribute("id"));

										int num = 1;
										while (rs2.next()) {
									%>
									<tr>
										<td><%=num%></td>
										<td><%=rs2.getString("user_name")%></td>
										<td><%=rs2.getString("user_num")%></td>
										<td><%=rs2.getString("course_name")%></td>
										<td><%=rs2.getString("course_level")%></td>
										<td><%=rs2.getString("stu_grade")%></td>
									</tr>
									<%
										num++;
										}

										rs1.close();
									%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--查询课表界面-->
			<div id="Class"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">查询课表</span>
				</div>

				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%">
								<table border="1" cellspacing="0" cellpadding="15"
									style="font-size: 12px; width: 100%; height: 100%; text-align: center;">
									<tr>
										<td></td>
										<td>周一</td>
										<td>周二</td>
										<td>周三</td>
										<td>周四</td>
										<td>周五</td>
									</tr>
									<%
										UserDao userDao3 = new UserDao();
										ResultSet rs3 = userDao3.getCourse((String) session.getAttribute("id"));

										while (rs3.next()) {
									%>
									<tr>
										<td><%=rs3.getString("Time")%></td>
										<td><%=rs3.getString("day_1")%></td>
										<td><%=rs3.getString("day_2")%></td>
										<td><%=rs3.getString("day_3")%></td>
										<td><%=rs3.getString("day_4")%></td>
										<td><%=rs3.getString("day_5")%></td>
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--修改信息界面-->
			<div id="SetUser"
				style="display: none; width: 100%; height: 100%; float: left;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">修改信息</span>
				</div>
				<%
					UserDao userDao4 = new UserDao();
					ResultSet rs4 = userDao4.getUserInfo((String) session.getAttribute("id"));
					if (rs4.next()) {

					}
				%>
				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%; padding-top: 0.5px">
								<form action="${pageContext.request.contextPath}/uploadServlet"
									method="post" enctype="multipart/form-data"
									onsubmit="return checkInfo()">
									<div class="centerdiv" style="margin-left: 23%; float: left;"></div>
									<div style="float: left; margin-top: 10px; margin-left: 12%;">
										<input type="text" id="userid" name="userid" value=""
											style="display: none;"> 姓名：<input type="text"
											name="userName" id="userName" value=""
											style="border-radius: 5px; border:0 ; height: 20px"><br /> <br />
										密码：<input type="password" name="userPass" id="userPass"
											value="" style="border-radius: 5px; border:0 ; height: 20px"><br />
										<br /> 昵称：<input type="text" name="userNickname"
											id="userNickname" value=""
											style="border-radius: 5px; border:0 ; height: 20px"><br /> <br />
										出生日期：<input type="date" name="userDate" id="userDate" value=""
											style="border-radius: 5px; border:0 ; height: 23px;width: 123px;"><br /> <br />
										性别：<input type="radio" value="男" name="useSex"
											style="color: grey;" />&nbsp;男&nbsp; <input type="radio"
											value="女" name="userSex" style="color: grey;" />&nbsp;女&nbsp;<br />
										<br /> 年龄：<input type="text" name="userAge" id="userAge"
											value="" style="border-radius: 5px; border:0 ; height: 20px"><br />
										<br /> 邮箱：<input type="text" name="userEmail" id="userEmail"
											value="" style="border-radius: 5px; border:0 ; height: 20px"><br />
										<br /> 头像：<input type="file" name="head_image"
											id="head_image" value=""><br /> <br /> <input
											type="submit" value="保存" id="baocunb" /> <br /> <br /> <input
											type="reset" value="重置" id="chongzhib" />
									</div>
									<div class="centerdiv" style="float: left;"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"
		color="0,0,0" opacity='1' count="166"></script>
</body>

</html>