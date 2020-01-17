<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>教务管理系统—管理员</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#tianjiab1 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
}

#tianjiab1:hover {
	background-color: #ECF5FF;
}

#chongzhib1 {
	
}

#chongzhib1:hover {
	background-color: #ECF5FF;
}

#tianjiab2 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	margin-left: 100px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
}

#tianjiab2:hover {
	background-color: #ECF5FF;
}

#chongzhib2 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	margin-left: 100px;
	border-radius: 5px;
	background-color: #D2E9FF;
	cursor: pointer;
}

#chongzhib2:hover {
	background-color: #ECF5FF;
}

#baocunb3 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
}

#baocunb3:hover {
	background-color: #ECF5FF;
}

#chongzhib3 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #D2E9FF;
	cursor: pointer;
}

#chongzhib3:hover {
	background-color: #ECF5FF;
}

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
	var as ="<%=asd%>";
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

	<!--设置添加人员跳转和颜色变化-->
	function lookClass() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div2").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";
		document.getElementById("div3").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0.4);";
		document.getElementById("div4").style = "width: 100%; height: 12%;background-color: rgba(0, 0, 0, 0);";

	};

	<!--设置添加课表跳转和颜色变化-->
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
		var head_image = document.getElementById("userid").value;
		document.getElementById("userid").value =<%=session.getAttribute("id")%>;

		if (userName == null || userName == "") {
			alert("用户名为空！");
			return false;
		}
		if (userPass == null || userPass == "") {
			alert("密码为空！");
			return false;
		}
		if (userNickname == null || userNickname == "") {
			alert("昵称为空！");
			return false;
		}
	}

	<!--设置验证输入框是否为空-->
	function checkInfo2() {
		var userName1 = document.getElementById("userName1").value;
		var userPass1 = document.getElementById("userPass1").value;
		var userNum1 = document.getElementById("userNum1").value;
		var userSex1 = document.getElementById("userSex1").value;
		var user_type1 = document.getElementById("user_type").value;

		if (userName1 == null || userName1 == "") {
			alert("姓名为空！");
			return false;
		}
		if (userPass1 == null || userPass1 == "") {
			alert("密码为空！");
			return false;
		}
		if (userNum1 == null || userNum1 == "") {
			alert("学号为空！");
			return false;
		}
		if (userSex1 == null || userSex1 == "") {
			alert("性别为空！");
			return false;
		}
		if (user_type1 == null || user_type1 == "") {
			alert("身份为空！");
			return false;
		}
	}

	<!--设置验证输入框是否为空-->
	function checkInfo3() {
		var userId = document.getElementById("userId1").value;
		var courseName = document.getElementById("courseName").value;
		var courseTime = document.getElementById("courseTime").value;
		var courseDay = document.getElementById("courseDay").value;

		if (userId == null || userId == "") {
			alert("学生编号为空！");
			return false;
		}
		if (courseName == null || courseName == "") {
			alert("课程名称为空！");
			return false;
		}
		if (courseTime == null || courseTime == "") {
			alert("课程节数为空！");
			return false;
		}
		if (courseDay == null || courseDay == "") {
			alert("课程周几为空！");
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
				style="font-family: '华文行楷'; color: white; float:right; margin-top: 32px; font-size: 24px;">
				欢迎管理员,<%=rs0.getString("user_name")%></h1>
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
					添加人员</span>
			</div>
			<div id="div3" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="lookClass()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					添加课程</span>
			</div>
			<div id="div4" style="width: 100%; height: 12%; cursor: pointer;"
				onclick="updateUserInfo()">
				<br /> <span
					style="margin-left: 35px; color: white; font-size: 20px; font-family: 楷体; cursor: pointer;">☼
					修改信息</span>
			</div>
		</div>
		<!--右边功能盒子-->
		<div style="width: 88%; height: 655px; float: left;">

			<!--个人信息界面-->
			<div id="User"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
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

			<!--添加人员界面-->
			<div id="Score"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">添加人员</span>
				</div>

				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%">
								<form action="douserinfo.jsp" method="post"
									style="margin-left: 36%;" onsubmit="return checkInfo2()">
									<div style="float: left; margin-top: 32px; margin-left: 30px">
										姓名：<input type="text" name="userName1" id="userName1" value=""
											style="border-radius: 5px;border:0; height: 20px"><br /> <br />
										<br /> 密码：<input type="password" name="userPass1"
											id="userPass1" value=""
											style="border-radius: 5px;border:0; height: 20px"><br /> <br />
										<br /> 学号：<input type="text" name="userNum1" id="userNum1"
											value="" style="border-radius: 5px; height: 20px"><br />
										<br /> <br /> 性别：<input type="radio" name="userSex1"
											id="userSex1" value="男">&nbsp;男 <input type="radio"
											name="userSex1" id="userSex1" value="女">&nbsp;女<br />
										<br /> <br /> <select name="user_type" id="user_type"
											style="width: 210px">
											<option value="">--请选择身份--</option>
											<%
												UserDao ud = new UserDao();
												ResultSet rst = ud.getUserType();
												int yy = 1;
												while (rst.next()) {
											%>
											<option value="<%=rst.getString("user_type")%>"><%=rst.getString("user_type_name")%></option>
											<%
												yy++;

												}
											%>
										</select><br /> <br /> <br /> <font id="error" color="red"> </font>
										<input type="submit" value="添加" id="tianjiab1" /> <br /> <br />
										<input type="reset" value="重置" id="chongzhib1" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--添加课表界面-->
			<div id="Class"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">添加课程</span>
				</div>

				<div
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%; padding-top: 0.5px">
								<form action="docourseinfo.jsp" method="post"
									style="margin-left: 30%; margin-top: 7%"
									onsubmit="return checkInfo3()">
									<table style="width: 100%; height: 100%">
										<tr>
											<td>学生编号：</td>
											<td><input type="text" name="userId1" id="userId1"
												style="border-radius: 5px; border:0 ; height: 20px" value=""></td>
										</tr>
										<tr style="width: 20px; height: 30px;"></tr>
										<tr>
											<td>课程名称：</td>
											<td><input type="text" name="courseName" id="courseName"
												style="border-radius: 5px;  border:0 ; height: 20px" value=""></td>
										</tr>
										<tr style="width: 20px; height: 30px;"></tr>
										<tr>
											<td>课程节数：</td>
											<td><input type="text" name="courseTime" id="courseTime"
												style="border-radius: 5px;  border:0 ; height: 20px" value=""></td>
										</tr>
										<tr style="width: 20px; height: 30px;"></tr>
										<tr>
											<td>课程周几：</td>
											<td><select name="courseDay" style="width: 155px; border:0 ;height: 20px;border-radio:5px; ">
													<option value="">--请选择--</option>
													<option value="1">周一</option>
													<option value="2">周二</option>
													<option value="3">周三</option>
													<option value="4">周四</option>
													<option value="5">周五</option>
											</select></td>
										</tr>
										<tr style="width: 20px; height: 30px;"></tr>
										<tr>
											<td colspan="2" style="text-align: left;"><input
												type="submit" id="tianjiab2" value="添加"></td>
										</tr>
										<tr style="width: 20px; height: 30px;"></tr>
										<tr>
											<td colspan="2" style="text-align: left;"><input
												type="reset" id="chongzhib2" value="重置"></td>
										</tr>
									</table>
								</form>
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
								<form action="${pageContext.request.contextPath}/uploadSServlet"
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
											id="head_image" value="" style="border: 0;outline: 0;border-radius: 5px;"><br /> <br /> <input
											type="submit" value="保存" id="baocunb3" /> <br /> <br /> <input
											type="reset" value="重置" id="chongzhib3" />
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