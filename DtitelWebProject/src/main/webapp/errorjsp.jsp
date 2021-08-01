<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<style>
h1{

color: #fb2525;

margin-bottom: 5%;
}
body{

margin :0;
padding: 0;
background: url(back.jpg);
background-position: center;
font-family:sans-serif;

}

    *{
        font-family: 'Inter',sans-serif;
    }
    
 
</style>
<body >
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #fb2525;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-6">
	                <h1>Please check you Email, Telephone Number or Password and Login again!</h1>
	                 <a href="./resetpassword.jsp">
	        <button class="btn btn-success float-right" style="background-color: #fb2525;">
	            <p>Retry?</p>
	        </button>
	        </a>
	        <a href="./login.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Logout</p>
        </button>
 </a>
	 
            </div>
            <div class="col-md-3"></div>
        </div>
        
    </div>
</body>
</html>