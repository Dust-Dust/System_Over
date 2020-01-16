var b=document.getElementById("LoginButton");
b.onclick=function(){
	var username= document.getElementById("username");
	var userpass= document.getElementById("userpass");
	var yanzhengCode = document.getElementById("yanzhengCode");
	var usertype = document.getElementById("user_type");
	var user_type="";
	for(var i = 0;i<usertype.length;i++){
		if(usertype[i].checked == true){
			user_type = usertype[i].value;
		}
	}
	
	if(username.value == ""){
		alert("姓名为空，请输入！");
		return;
	}else if(userpass.value == ""){
		alert("密码为空，请输入！");
		return;
	}else if(yanzhengCode.value == ""){
		alert("验证码为空，请输入！");
		return;
	}else if(usertype.value == ""){
		alert("请选择身份！");
	}else{
		window.location.href="main.jsp";
	}
}
