<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form DigiTel</title>
<style>
body{

margin :0;
padding: 0;
background: url(back.jpg);
background-position: center;
font-family:sans-serif;

}
.loginbox{
width: 500px;
height: 500px;
background : #000;
color: #fff;
top: 50%;
left: 50%;
position: absolute;
transform: translate(-50%, -50%);
box-sizing: border-box;
padding: 70px 30px;
}
.avatar{
width: 100px;
height: 100px;
border-radius: 50%;
position: absolute;
top: -50px;
left: calc(50%, -50px);

}
h2{
text-align: center;
color: #fb2525;
font-size: 90px;
margin-bottom: 5%;
}
h1{
margin: 0;
padding: 0 0 20px;
text-align: center;
font-size: 22px;
}
.loginbox p
{
margin: 0;
padding: 0;
font-weight: bold;
}
.loginbox input{
width: 100%;
margin-bottom: 20px;
}
.loginbox input[type="text"], input[type="password"]{
border: none;
border-bottom: 1px solid #fff;
background: transparent;
outline: none;
height: 40px;
color: #fff;
font-size: 16px;

}
.loginbox input[type="submit"]{
border: none;
outline:none;
height:40px;
background: #fb2525;
color: #fff;
font-size: 18px;
border-radius: 20px;
}
.loginbox input[type="submit"]:hover{
cursor: pointer;
background: ffc107;
color: #000;
}
.loginbox a{
text-decoration: none;
font-size: 12px;
line-height: 20px;
color: darkgrey;
}
.loginbox a:hover{
color: ffc107;
}

</style>
<script type="text/javascript">
 function validate(){
	 var uname = document.myForm.username.value;
	 var pass = document.myForm.password.value;
	 var regexmail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 
	 if(uname==""){
		 alert("please enter username");
		 document.myForm.username.focus();
		 return false;
		 }
	 if(!(uname.match(regexmail) || uname.match(regextele)))
	 {
	 alert("Please enter correct Email / Telephone Number");
	 document.myForm.username.focus();
	 return false;
	 
	 }
	 
	 if(pass==""){
		 alert("please enter password");
		 document.myForm.password.focus();
		 return false;
		 }
	 
	 
 }
</script>
</head>
<body>
<<h2>Welcome to  DigiTel!</h2>

<div class="loginbox">

<h1 style="font-size: 30px" >Login Here</h1>
<form name ="myForm" action="login" method ="post" onsubmit="return validate()">
<p>Email/Telephone Number</p>
<input type="text" name="username" placeholder="Enter a username">
<p>Password</p>
<input type="password" name="password"  placeholder="Enter Password">
<input type="submit" name="" value="Login">

</form>
</div>
</body>
</html>

