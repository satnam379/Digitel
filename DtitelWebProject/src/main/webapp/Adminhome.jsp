<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Digitel Web Application</title>
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
font-size: 90px;
margin-bottom: 5%;
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
<body>
<h1>Admin Created Successfully!</h1>
<div class ="center">
<a href="./adduserdetail.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Back to Home</p>
        </button>
 </a>
 </div>
 
 <div class ="center">
 <a href="./login.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Logout</p>
        </button>
 </a>
 </div>



</body>
</html>

    