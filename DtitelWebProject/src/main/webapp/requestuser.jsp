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
           
                <form method="get"  name="myForm">
                
                 <% 
						     String id =request.getParameter("id");
						    
						    	 
						    	 //Class.forName("com.mysql.jdbc.Driver");
						    	 
						    	 //con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
						    	 stmt=con.createStatement();
						    	 
						    	 String data;
						    	 
						    	  data = "SELECT * FROM USERREQUESTSS WHERE ID ='"+id+"'";
						    	 
						    	 
						    	 rs=stmt.executeQuery(data);
						    	 while(rs.next())
						    	 {
						          %>
                
                
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #fb2525;;"><b>Make New Request</b></div>
                    
                    <div class="card-body">
                           
                             
						     <input type = "hidden" name="id" value="<%=rs.getString("id")%>"/>
                           
                             <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name"  required value="<%=rs.getString("name")%>" readonly >
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="telenum"  required value="<%=rs.getString("telenum")%>" readonly>
                            </div>
                            
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Current Stage</b></label>
                              <input type="text" class="form-control" name="stage"  required value="<%=rs.getString("stage")%>" readonly>
                            </div>
                             
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage For Request</b></label>
                                <select name="requestedstage" class="form-control" required>
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                            

                                               
                    </div>
                       <%           
				 }
				%>
                   
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #fb2525;" >Make request</button>
                        <a href="./userdashboardview.jsp" class="btn btn-success float-right" style="background-color: #fb2525;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                
                </form>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>

                <%

String b = request.getParameter("name");
String c = request.getParameter("telenum");
String d = request.getParameter("stage");

String e = request.getParameter("requestedstage");


if(b!=null && c!=null  && d!=null && e!=null)
{
	String query2 = " INSERT INTO REQUESTUSERS " + " (NAME, TELENUM, CURRENTSTAGE, REQUESTEDSTAGE) VALUES " + " (?,?, ?, ?) ";
	//String query2 = "update USERLOGIN set NAME=?, TELENUM=?,EMAIL=?, STAGE=?, PASSWORD=? where ID=? ";
	ps = con.prepareStatement(query2);
	
	ps.setString(1, b.toUpperCase());
	ps.setString(2, c);
	ps.setString(3, d);
	ps.setString(4, e);
	
	
	
	
	
	 int i = ps.executeUpdate();
	 
	 if(i>0){
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('Request Submitted successfully!');");
		    out.println("window.location.href = \"userdashboardview.jsp\";");
		    out.println("</script>");
			//response.sendRedirect("./Dashboard.jsp");
		}
		else{
			out.println("Error occured");
		}
	 
}
%>
</html>








  