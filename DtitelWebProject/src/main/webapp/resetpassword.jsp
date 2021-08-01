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
    
    
<script type="text/javascript">
 function Validate(){

	 var tele = document.myForm.telenum.value;
	 var mail = document.myForm.email.value;
	 var pwd = document.myForm.password.value;
	 var newpwd = document.myForm.newpassword.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	 
	 if(!mail.match(regexemail)){
		 alert("please enter correct email format, example- xyz@gmail.com");
		 document.myForm.email.focus();
		 return false;
		 }
	 if(!tele.match(regextele)){
		 alert("Input an Phone No.[xxxxxxxxxx] of 10 digits");
		 document.myForm.telenum.focus();
		 return false;
		 }
	 
	 if(!pwd.match(regexpwd)){
		 alert("this not a correct format of password, rite correct format");
		 document.myForm.password.focus();
		 return false;
		 }
	 if(!newpwd.match(regexpwd)){
		 alert("password should contain 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
		 document.myForm.newpassword.focus();
		 return false;
		 }
	 
 }
</script>        
</head>


<style>
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
                <form method="post" name="myForm" action="Reset" onsubmit="return Validate()">
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #fb2525;;"><b>Reset Password</b></div>
                    <div class="card-body">
                        
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Email</b></label>
                              <input type="text" class="form-control mt-0" name="email" required>
                            
                            </div>
                             
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone Number</b></label>
                              <input type="text" class="form-control" name="telenum" required>
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Current Password</b></label>
                              <input type="password" class="form-control" name="password" required>
                            </div>
                            
                             <div class="form-group mt-2">
                              <label class="mb-0"><b>New Password</b></label>
                              <input type="password" class="form-control" name="newpassword" required>
                            </div>
                            
                          
                    </div>
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #fb2525;" >Reset Password</button>
                        <a href="userdashboardview.jsp" class="btn btn-success float-right" style="background-color: #fb2525;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        
    </div>
</body>
</html>