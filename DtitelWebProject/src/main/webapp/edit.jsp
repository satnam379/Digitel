<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.ResultSet" %>
 <%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
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

<script type="text/javascript">
 function Validate(){
	 var nam = document.myForm.name.value;
	 var tele = document.myForm.telenum.value;
	 var mail = document.myForm.email.value;
	 var step = document.myForm.stage.value;
	 var pwd = document.myForm.password.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 var regexnam = /^[a-zA-Z ]{2,30}$/;
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	
	 if(!nam.match(regexnam)){
		 alert("Input  a valid name");
		 document.myForm.name.focus();
		 return false;
		 }
	 
	 if(!tele.match(regextele)){
		 alert("Input an Phone No.[xxxxxxxxxx] of 10 digits");
		 document.myForm.telenum.focus();
		 return false;
		 }
	 
	 if(!mail.match(regexemail)){
		 alert("please enter correct email, example- xyz@gmail.com");
		 document.myForm.email.focus();
		 return false;
		 }
	 if(!pwd.match(regexpwd)){
		 alert("password should contain 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
		 document.myForm.password.focus();
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
           
                <form method="post"  name="myForm" action="" onsubmit="return Validate()">
                
                 <% 
						     String id =request.getParameter("id");
						    
						    	 
						    	 //Class.forName("com.mysql.jdbc.Driver");
						    	 
						    	 //con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
						    	 stmt=con.createStatement();
						    	 
						    	 String data;
						    	 
						    	  data = "SELECT * FROM USERLOGIN WHERE ID ='"+id+"'";
						    	 
						    	 
						    	 rs=stmt.executeQuery(data);
						    	 while(rs.next())
						    	 {
						          %>
                
                
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #fb2525;;"><b>Edit user</b></div>
                    
                    <div class="card-body">
                           
                             
						          <input type = "hidden" name="id" value="<%=Integer.parseInt(rs.getString("id"))%>"/>
                           
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name"  required value="<%=rs.getString("name")%>">
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="telenum"  required value="<%=rs.getString("telenum")%>">
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Email</b></label>
                              <input type="text" class="form-control" name="email"  required value="<%=rs.getString("email")%>">
                            </div>
                             
                           
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Password</b></label>
                              <input type="text" class="form-control" name="password"  required value="<%=rs.getString("password")%>">
                            </div>
                                

                                               
                    </div>
                       <%           
				 }
				%>
                   
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #fb2525;" >Update User</button>
                        <a href="./Dashboard.jsp" class="btn btn-success float-right" style="background-color: #fb2525;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                
                </form>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>

                <%
String a = request.getParameter("id");
String b = request.getParameter("name");
String c = request.getParameter("telenum");
String d = request.getParameter("email");

String e = request.getParameter("password");


if(a!=null && b!=null && c!=null  && d!=null  && e!=null )
{
	
	String query2 = "update USERLOGIN set NAME=?, TELENUM=? ,EMAIL=?, PASSWORD=? where ID=? ";
	ps = con.prepareStatement(query2);
	
	ps.setString(1, b.toUpperCase());
	ps.setString(2, c);
	ps.setString(3, d);
	ps.setString(4, e);
	ps.setString(5, a);
	
	
	
	 int i = ps.executeUpdate();
	 
	 if(i>0){
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('User has been Updated successfully!');");
		    out.println("window.location.href = \"Dashboard.jsp\";");
		    out.println("</script>");
			//response.sendRedirect("./Dashboard.jsp");
		}
		else{
			out.println("Error occured");
		}
	 
	
}
%>
</html>

