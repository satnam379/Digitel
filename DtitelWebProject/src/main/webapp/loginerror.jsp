<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{

margin :0;
padding: 0;
background: url(back.jpg);
background-position: center;
font-family:sans-serif;

}
h1{
text-align: center;
color: #fb2525;
font-size: 70px;
margin-bottom: 5%;
}
h2{
text-align: center;
color: #fff;
font-size: 40px;
margin-bottom: 3%;
}
.btn{
width: 20%;
height: 80px;
}
div{
margin-bottom: 2%;
}
.center{

text-align:center;
}
p{
font-size:25px;
}
</style>
</head>
<body >
<h1>Digitel</h1>
<h2>User with these Email/TelePhone Number or password does not exist!</h2>
<h2>Please check your Email/Telephone Number or Password and Login Again!</h2>
<div class ="center">
<a href="./login.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Try Login again?</p>
        </button>
 </a>
 </div>


</body>
</html>