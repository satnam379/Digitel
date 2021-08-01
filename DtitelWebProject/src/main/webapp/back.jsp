<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
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

<body style="background-color: #000;">
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #fb2525;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <table>
    <tr>
    <td>   
 <div class ="center">
<a href="./AddUser.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Add More User</p>
        </button>
 </a>
 </div>
 </td>
    </tr>
    <td>
    <div class ="center">
<a href="./AddUser.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Add More User</p>
        </button>
 </a>
 </div>
 </td>
    <tr>
    <td>
    <div class ="center">
<a href="./login.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Logout</p>
        </button>
 </a>
 </div>
 </td>
    </tr>
    
    </table>
   
 
    
</body>
</html>