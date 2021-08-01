<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%@ page import = "com.DigiTel.Servlet.bean.LoginBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Digitel Web Application</title>
<style>
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
body{

margin :0;
padding: 0;
background: url(back.jpg);
background-position: center;
font-family:sans-serif;

}

</style>


<script type="text/javascript">
 function Validate(){
	 alert("SuccessFully Logout, Click 'OK' to login again'");
	 
	 return true;
	 
	 
 }
</script> 
</head>
<body >
<%

Connection con;
Statement stmt;
ResultSet r1;

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "satnam", "test");

%>
<h1>Welcome to  DigiTel!</h1>

<div class ="center">
 <a href="./resetpassword.jsp">
        <button class="btn btn-success float-right" style="background-color: #fb2525;">
            <p>Reset Password?</p>
        </button>
 </a>
 </div>
<div class ="center">
 <a href="./login.jsp">
        <button class="btn btn-success float-right"  style="background-color: #fb2525;">
            <p>Logout</p>
            
            <div>
            <%
            
           
    		PreparedStatement ps;
    		PreparedStatement ps1;
    		String sql2;
    		String Username = (String)request.getAttribute("theUserName");
    		String data = "Select * from LASTLOGIN where USERNAME='"+Username+"'";
    		
    		try {
    			ps = con.prepareStatement(data);
    			 r1= ps.executeQuery(data);
    			 
    			 if(r1.next()) {
    					sql2= "UPDATE LASTLOGIN set LASTLOGINDATE = SYSTIMESTAMP where USERNAME=?";
    				}
    				else {
    					
    					sql2 = "INSERT INTO LASTLOGIN (USERNAME, LASTLOGINDATE) VALUES(?, SYSTIMESTAMP) ";
    				}
    			 ps1 = con.prepareStatement(sql2);
    				ps1.setString(1, Username);
    				int rs = ps1.executeUpdate();
    		} catch (SQLException e1) {
    			// TODO Auto-generated catch block
    			e1.printStackTrace();
    		}
            
            %>
            </div>
        </button>
 </a>
 </div>

</body>
</html>

    