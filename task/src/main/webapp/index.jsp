<%@ page import = "java.sql.*" %>
 <%
 String username = request.getParameter("username");
 String password = request.getParameter("password");
 try{
	 Class.forName("oracle.jdbc.OracleDriver");		
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SATNAM", "test");
	 String sql = "select * from adminlogin where email = '"+username+"' and password = '"+password+"'";
     PreparedStatement ps = conn.prepareStatement(sql);
     ResultSet rs= ps.executeQuery();
     if(rs.next()){
    	 System.out.println("login sucess");
    	 
     }
     else{
    	 System.out.println("login invalid");
    	 
    	 
     }
 }
 catch(Exception e){
	 
 }
 %>
<!DOCTYPE html>
<html>
<head>
<title>Login Form DigiTel</title>
<style>
body{
margin :0;
padding: 0;
background: url(/home/satnam/git/DigiTelProject/task/src/main/webapp/WEB-INF/avatar.jpeg);
background-position: center;
font-family:sans-serif;

}
.loginbox{
width: 320px;
height: 420px;
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
</head>
<body>
<div class="loginbox">
<img src = "/home/satnam/git/DigiTelProject/task/src/main/webapp/avatarlogin.png" class="avatar">
<h1>User Login</h1>
<form action="">
<p>Username</p>
<input type="text" name="username" placeholder="Enter a username" id ="username">
<p>Password</p>
<input type="password" name="password" placeholder="Enter Password" id="password">
<input type="submit" name="" value="Login">
<a href="#">Forgot Password?"></a><br>
<a href="./adminlogin.jsp">Admin Login?</a>
</form>
</div>
</body>
</html>
