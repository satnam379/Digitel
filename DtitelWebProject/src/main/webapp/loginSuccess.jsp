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

<script type="text/javascript">
 function Validate(){
	 alert("SuccessFully Logout");
	 
	 return true;
	 
	 
 }
</script>    
</head>
<body >
<h1>Welcome to  DigiTel!</h1>
<div class ="center">
<a href="./viewrequest.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>View Requests</p>
        </button>
 </a>
 </div>
 
 <div class ="center" >
 <a href="./Dashboard.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Dashboard</p>
        </button>
 </a>
 </div>
 <div class ="center">
 <a href="./login.jsp">
        <button class="btn btn-success float-right" onclick="return Validate()" style="background-color: #fb2525;">
            <p>Logout</p>
        </button>
 </a>
 </div>



</body>
</html>

    