<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>教务管理系统—教师</title>

<style>
/*保存按钮设置*/
#baocunb3 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
}

/*按钮设置移动变色*/
#baocunb3:hover {
	background-color: #ECF5FF;
}

/*重置按钮设置*/
#chongzhib3 {
	border: 0;
	outline: none;
	width: 200px;
	height: 30px;
	border-radius: 5px;
	background-color: #D2E9FF;
	cursor: pointer;
}

/*按钮设置移动变色*/
#chongzhib3:hover {
	background-color: #ECF5FF;
}

/*个人信息中的竖线*/
.centerdiv {
	float: left;
	width: 50px;
	margin-top: 6px;
	border-right: 1.5px solid darkgrey;
	padding-bottom: 450px;
	margin-bottom: 450px;
}

/*修改按钮设置*/
#btn1 {
	border: 0;
	outline: none;
	width: 50px;
	height: 30px;
	border-radius: 5px;
	background-color: #ACD6FF;
	cursor: pointer;
}

/*修改设置移动变色*/
#btn1:hover {
	background-color: #ECF5FF;
}

/*删除按钮设置*/
#btn2 {
	border: 0;
	outline: none;
	width: 50px;
	height: 30px;
	border-radius: 5px;
	background-color: #D2E9FF;
	cursor: pointer;
}

/*删除设置移动变色*/
#btn2:hover {
	background-color: #ECF5FF;
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
		document.getElementById("User").style.display = "block";
		document.getElementById("Class").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style="width: 100%; height: 12%;background-color:#6C6C6C";
		document.getElementById("div2").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div3").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div4").style="width: 100%; height: 12%;background-color:#3C3C3C";
	};

	<!--设置修改成绩跳转和颜色变化-->
	function lookClass() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Class").style.display = "block";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div2").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div3").style="width: 100%; height: 12%;background-color:#6C6C6C";
		document.getElementById("div4").style="width: 100%; height: 12%;background-color:#3C3C3C";
		
	};
	
	<!--设置查询课表跳转和颜色变化-->
	function lookScore() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Class").style.display = "none";
		document.getElementById("Score").style.display = "block";
		document.getElementById("SetUser").style.display = "none";
		document.getElementById("div1").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div2").style="width: 100%; height: 12%;background-color:#6C6C6C";
		document.getElementById("div3").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div4").style="width: 100%; height: 12%;background-color:#3C3C3C";
	};
	
	<!--设置修改信息跳转和颜色变化-->
	function updateUserInfo() {
		document.getElementById("User").style.display = "none";
		document.getElementById("Class").style.display = "none";
		document.getElementById("Score").style.display = "none";
		document.getElementById("SetUser").style.display = "block";
		document.getElementById("div1").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div2").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div3").style="width: 100%; height: 12%;background-color:#3C3C3C";
		document.getElementById("div4").style="width: 100%; height: 12%;background-color:#6C6C6C";
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
	
	function updateScore(gradeId){
		document.getElementById("update").style.display="block";
		document.getElementById("grade_id").value=gradeId;
	}
	
	function noneback(){
		document.getElementById("update").style.display="none";
	}
</script>

<body>
	<!--大盒子-->
	<div id="big_box">
		<!--顶端盒子-->
		<%
			UserDao userDao0 = new UserDao();
			ResultSet rs0 = userDao0.getUserInfo((String) session.getAttribute("id"));
			if (rs0.next()) {

			}
		%>
		<div style="width: 100%; height: 95px; background-color: #005AB5;">
			<img src="img/titlemain.png"
				style="height: auto; float: left; width: auto; margin-left: 30px; margin-top: 15px" />
			<h1
				style="font-family: '华文行楷'; color: white; float: left; margin-left: 10px; margin-top: 32px; font-size: 24px;">
				欢迎教师,<%=rs0.getString("user_name")%></h1>
			<h1
				style="font-family: '华文行楷'; float: left; font-size: 20px; text-align: right; margin-top: 5px; color: white; cursor: pointer; text-decoration: underline"
				onclick="window.location.href='Login.jsp'">退出系统</h1>
		</div>
		<!--左边功能盒子-->
		<div
			style="width: 12%; height: 655px; background-color: #3C3C3C; float: left;">
			<!--//功能-->
			<div id="div1"
				style="width: 100%; height: 12%; background-color: #6C6C6C">
				<br /> <span
					style="margin-left: 40px; cursor: pointer; color: white;"
					onclick="lookUser()">☼ 个人信息</span>
			</div>
			<div id="div2"
				style="width: 100%; height: 12%; background-color: #3C3C3C">
				<br /> <span
					style="margin-left: 40px; cursor: pointer; color: white;"
					onclick="lookScore()">☼ 查询课表</span>
			</div>
			<div id="div3"
				style="width: 100%; height: 12%; background-color: #3C3C3C">
				<br /> <span
					style="margin-left: 40px; cursor: pointer; color: white;"
					onclick="lookClass()">☼ 修改成绩</span>
			</div>
			<div id="div4"
				style="width: 100%; height: 12%; background-color: #3C3C3C">
				<br /> <span
					style="margin-left: 40px; cursor: pointer; color: white;"
					onclick="updateUserInfo()">☼ 修改信息</span>
			</div>
		</div>
		<!--右边功能盒子-->
		<div
			style="width: 88%; height: 655px; background-color: lightblue; float: left;">

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

			<!--查询课表界面-->
			<div id="Score"
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
										UserDao userDao2 = new UserDao();
										ResultSet rs2 = userDao2.getCourse((String) session.getAttribute("id"));

										//int num2 = 1;
										while (rs2.next()) {
									%>
									<tr>
										<td><%=rs2.getString("Time")%></td>
										<td><%=rs2.getString("day_1")%></td>
										<td><%=rs2.getString("day_2")%></td>
										<td><%=rs2.getString("day_3")%></td>
										<td><%=rs2.getString("day_4")%></td>
										<td><%=rs2.getString("day_5")%></td>
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

			<!--修改成绩界面-->
			<div id="Class"
				style="width: 100%; height: 100%; float: left; margin-top: 2px; display: none;">
				<div style="width: 100%; height: 10%; background-color: white;">
					<br /> <span
						style="font-family: '华文行楷'; color: black; margin-left: 20px; font-size: 24px">修改成绩</span>
				</div>
				
				 <!--修改成绩小窗口-->
				<div id="update"
					style="display: none; width: 300px; height: 100px; background-color: rgba(245, 245, 245, 0.3); position: absolute; top: 400px; left: 250px; z-index: 9999; left:600px;">
					<form action="deleteUserScore" method="post" style="margin-left: 40px;margin-top: 30px">
						<table>
							<tr>
								<td>成绩：</td>
								<td><input type="text" name="stu_grade" value=""> <input
									type="text" name="grade_id" style="display: none" id="grade_id"
									value=""></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" name="save" value="保存"
									style="border: 0; outline: none; width: 50px; height: 20px; border-radius: 5px; background-color: lavender;" />
									<input type="button" name="back" value="返回" onclick="noneback()" style="border: 0; outline: none; width: 50px; height: 20px; border-radius: 5px; background-color: lavender;" >
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="Score"
					style="width: 96.7%; height: 83.6%; border: 20px solid lightgrey;">
					<div style="width: 93.2%; height: 85.4%; border: 40px solid white;">
						<div
							style="width: 100%; height: 100%; background-color: lightgrey;">
							<div style="width: 100%; height: 100%">
								<div id=""
									style="width: 100%; height: 100%; margin-left: 5px; float: left;">
									<table border="0" cellspacing="0" cellpadding="0"
										style="height: 70%; width: 100%">
										<tr>
											<td>编号</td>
											<td>姓名</td>
											<td>学号</td>
											<td>课程名</td>
											<td>课程学分</td>
											<td>成绩</td>
											<td>操作</td>
										</tr>
										<%
											UserDao userDao5 = new UserDao();
											ResultSet rs5 = userDao5.getUserScore((String) session.getAttribute("id"));

											int num = 1;
											while (rs5.next()) {
										%>
										<tr>
											<td><%=num%></td>
											<td><%=rs5.getString("user_name")%></td>
											<td><%=rs5.getString("user_num")%></td>
											<td><%=rs5.getString("course_name")%></td>
											<td><%=rs5.getString("course_level")%></td>
											<td><%=rs5.getString("stu_grade")%></td>
											<td>
												<form action="deleteUserScore" method="post">
													<input style="display: none;" type="text" name="grade_id"
														value="<%=rs5.getString("grade_id")%>"> <input
														type="button" id="btn1" value="修改"
														onclick="updateScore(<%=rs5.getString("grade_id")%>)">
													<input type="submit" name="btn2" id="btn2" value="删除">
												</form>
											</td>

										</tr>
										<%
											num++;
											}

											rs5.close();
										%>
									</table>
									<div>
										<form action="InsertStuScoredeal.jsp" method="post" style="margin-top: 30px" id="jia">
											学号：<input type="text" name="user_num"> 成绩：<input
												type="text" name="stu_grade"> 课程ID：<input
												type="text" name="course_id"> <input type="submit"
												name="tianjia" value="添加">
										</form>
									</div>

								</div>
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
								<form action="${pageContext.request.contextPath}/uploadTServlet"
									method="post" enctype="multipart/form-data"
									onsubmit="return checkInfo()">
									<div class="centerdiv" style="margin-left: 23%;float: left;"></div>
									<div style="float: left; margin-top: 10px;margin-left: 12%;">
										<input type="text" id="userid" name="userid" value=""
											style="display: none;"> 姓名：<input type="text"
											name="userName" id="userName" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 密码：<input type="password" name="userPass"
											id="userPass" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 昵称：<input type="text" name="userNickname"
											id="userNickname" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 出生日期：<input type="date" name="userDate"
											id="userDate" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 性别：<input type="radio" value="男" name="useSex" style="color:grey;"/>&nbsp;男&nbsp;
											<input type="radio" value="女" name="userSex" style="color:grey;"/>&nbsp;女&nbsp;<br />
										<br /> 年龄：<input type="text" name="userAge"
											id="userAge" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 邮箱：<input type="text" name="userEmail"
											id="userEmail" value=""
											style="border-radius: 5px; height: 20px"><br />
										<br /> 头像：<input type="file" name="head_image"
											id="head_image" value=""><br /> <br />  <input
											type="submit" value="保存" id="baocunb3" /> <br /> <br /><input
											type="reset" value="重置" id="chongzhib3	" />
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
	</div>
</body>

</html>