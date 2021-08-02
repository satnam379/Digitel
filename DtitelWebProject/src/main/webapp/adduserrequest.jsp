<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.ResultSet" %>
 <%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%
String host = "jdbc:oracle:thin:@localhost:1521/xe";
Statement stmt;
ResultSet rs;
Connection con = null;
PreparedStatement ps = null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection(host, "satnam", "test"); 
String Username = (String)request.getAttribute("theUserName");
%>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript">
 function Validate(){
	 var nam = document.myForm.name.value;
	 var tele = document.myForm.telenum.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 var regexnam =  /^[a-zA-Z ]{2,30}$/;
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	
	 if(!nam.match(regexnam)){
		 alert("Input  a valid name");
		 document.myForm.name.focus();
		 return false;
		 }
	 
	 if(!tele.match(regextele)){
		 alert("Input an Telehone No.[xxxxxxxxxx] of 10 digits");
		 document.myForm.telenum.focus();
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
<body>
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #fb2525;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <form name ="myForm" method="post" action="RequestUsers" onsubmit="return Validate()">
                
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #fb2525;;"><b>Add New Mobile Number</b></div>
                    <div class="card-body">
                    <% 
                        stmt = con.createStatement();
                    String Username1 = (String)request.getAttribute("theUserName");
                        String query = "SELECT * FROM USERLOGIN WHERE  EMAIL ='"+Username1+"' ";
                        rs=stmt.executeQuery(query);
                        if(rs.next()){
                        %>
                           <div class="form-group mt-2">
                              <label class="mb-0"><b>Owner</b></label>
                              <input type="text" class="form-control mt-0" name="owner" required value="<%=rs.getString("email")%>" >
                            
                            </div>
                        <%} %>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name" required>
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="telenum" required>
                            </div>
                            
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage</b></label>
                                <select name="stage" class="form-control" required>
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                           
                            
                                         
                       
                      
                    </div>
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #fb2525;" >Add Mobile Number
                          <div>
           
           
            </div>
                        
                        </button>
                        <a href="./userdashboardview.jsp" class="btn btn-success float-right" style="background-color: #fb2525;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>

 
</html>