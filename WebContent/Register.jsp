<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<title>教务管理系统注册界面</title>
		<style>
			/*注册按钮设置*/
			#LoginButton {
				display: inline-block;
				padding: 6px 55px;
				font-size: 20px;
				cursor: pointer;
				text-align: center;
				text-decoration: none;
				outline: none;
				color: #fff;
				background-color: deepskyblue;
				border: 0.5px solid darkgrey;
				border-radius: 3px;
			}
			
			/*注册按钮设置移动变色*/
			#LoginButton:hover {
				background-color: #46A3FF;
			}
			
			/*返回按钮设置*/
			#RegisterButton {
				display: inline-block;
				padding: 6px 55px;
				font-size: 20px;
				cursor: pointer;
				text-align: center;
				text-decoration: none;
				outline: none;
				color: black;
				background-color: white;
				border: 0.5px solid black;
				border-radius: 3px;
			}
			
			/*返回按钮设置移动变色*/
			#RegisterButton:hover {
				background-color: #46A3FF;
			}
		</style>
		
		<script type="text/javascript">
		<!--设置验证输入框是否为空-->
		function checkInfo() {
			var userNum = document.getElementById("usernum").value;
			var userName = document.getElementById("username").value;
			var userPass = document.getElementById("userpass").value;
			var userDate = document.getElementById("userdate").value;
			var userSex = document.getElementById("usersex").value;
			var userAge = document.getElementById("userage").value;
			var userEmail = document.getElementById("useremail").value;
			document.getElementById("userid").value = <%=session.getAttribute("id")%>;

			if (userNum == null || userNum == "") {
				alert("学号为空！");
				return false;
			}
			if (userName == null || userName == "") {
				alert("姓名为空！");
				return false;
			}
			if (userPass == null || userPass == "") {
				alert("密码为空！");
				return false;
			}
			if (userDate == null || userDate == "") {
				alert("出生日期为空！");
				return false;
			}
			if (userSex == null || userSex == "") {
				alert("性别为空！");
				return false;
			}
			if (userAge == null || userAge == "") {
				alert("年龄为空！");
				return false;
			}
			if (userEmail == null || userEmail == "") {
				alert("邮箱为空！");
				return false;
			}
		}
		</script>
	</head>

	<body>
		<!--整体盒子-->
		<div id="big_box" style="width: 100%;height: auto;background-color: white;">
			<!--顶部盒子-->
			<div style="width: 100%;height: 95px;background-color: #97CBFF;">
				<img src="img/title.png" style="height: auto;float: left;width: auto;margin-left: 30px;margin-top: 15px" />
			</div>
			<!--中间注册盒子-->
			<div style="width: 70%;height: 450px;background-color: white;margin: 0 auto;">
				<!--——注册——小盒子-->
				<div style="width: 100%;height:20% ;margin-top: 10px;">
					<hr style="width: 41.2%;float: left;margin-top: 45px;color: grey;margin-right: 5%;" />
					<h1 style="float: left;font-weight: 400;text-align: center;">注册</h1>
					<hr style="width: 41.2%;float:left;margin-top: 45px;color: grey;margin-left: 5%;" />
				</div>
				<!--注册输入框小盒子-->
				<form action="doregister.jsp" method="post">
					<div style="width: 100%;height: 80%;">
					<table style="margin: 0 auto;">
						<tr>
							<td>
								<input type="text" name="usernum" id="usernum" style="width: 350px;height: 30px; border-radius: 5px;margin-top: 20px;"placeholder="学号" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="text" name="username" id="username" style="width: 350px;height: 30px; border-radius: 5px;"placeholder="姓名" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="password" name="userpass" id="userpass" style="width: 350px;height: 30px; border-radius: 5px;"placeholder="密码" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="date" name="userdate" id="userdate" style="width: 350px;height: 30px; border-radius: 5px;;font-family: '微软雅黑';color:grey;"placeholder="出生日期" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="radio" value="男" name="usersex" style="color:grey;"/>&nbsp;男&nbsp;
								<input type="radio" value="女" name="usersex" style="margin-left: 50px;color:grey;" />&nbsp;女&nbsp;							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="number" name="userage" id="userage" style="width: 350px;height: 30px; border-radius: 5px;" min="18" max="60"placeholder="年龄" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td>
								<input type="text" name="useremail" id="useremail" style="width: 350px;height: 30px; border-radius: 5px;"placeholder="邮箱" />
							</td>
						</tr>
						<tr style="width: 20px; height: 5px;"></tr>
						<tr>
							<td style="text-align: center;">
								<input type="submit" name="submit" id="LoginButton" value="注册" />
								<input onclick="window.location.href='Login.jsp'" type="button" name="button3" id="RegisterButton" value="返回" style="margin-left: 50px;" />
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
			<!--底部盒子-->
			<div style="width: 100%;height: 135px;background-color: lightgrey;margin-top: 40px;"></div>
		</div>
	</body>
</html>