<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%@ page import = "com.DigiTel.Servlet.bean.LoginBean" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
    <script type="text/javascript">
 function validate(){
	 var find = document.myForm.search.value;
	 
	 var regexmail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 
	 if(find==""){
		 alert("please enter Telephone Number to search");
		 document.myForm.search.focus();
		 return false;
		 }
	 if(!(find.match(regextele))){
		 alert("please enter Telephone in digits");
		 document.myForm.search.focus();
		 return false;
		 }
	 
	 
	 
 }
</script>
</head>
<style>
p{
font-size: 18px;
color: white;
}
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
font-size: 50px;
margin-bottom: 5%;
}
.bot{
margin-left: 80%;


width: 20%;
height:10%;
background-color: #fb2525;
}
    *{
        font-family: 'Inter',sans-serif;
    }
</style>

<body >

<%
//String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Timestamp(System.currentTimeMillis()));
long current_time = System.currentTimeMillis();
Timestamp timestamp = new Timestamp(System.currentTimeMillis());
Connection con;
Statement stmt;
Statement stmt1;
ResultSet rs;
ResultSet rs1;
ResultSet Rs;


ResultSet RR;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "satnam", "test");
%>
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #fb2525;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
    
    <div class="bot">
                                
                                 
                                
                                
                                <%
                                String Username = (String)request.getAttribute("theUserName");
                                String username = request.getParameter("username");
                                LoginBean loginBean = new LoginBean();
                                loginBean.setUsername(username);
                               
                               
                                stmt=con.createStatement();
                                 
                               // int uname = session.getAttribute("theUserName");
                              
                                String data = "SELECT * FROM LASTLOGIN WHERE USERNAME like '%"+Username+"%'";
                                rs=stmt.executeQuery(data);
                                
                                %>
                               <div class= "login">
                               <%
                                 if(rs.next()){
                                	 
                                 
                                %>
                                
                                <p>Last Logged In-
                                <%=rs.getString("lastlogindate")
                                 
                                %>
                                </p>
                               
                                <% 
                                 }
                                else{
                                	%>
                                <p>You logged in First time</p>
                               
                                <%} %>
                                 </div>
                                </div>
                                
                                
                       
                                
                                
                                
                                
                                
                                
                                
        
        <div class="row mt-2" style="folot:left;">
           
            <div class="col-md-12">
               
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #fb2525;">
                     <div class="row">
                            <div class="col-6">
                                <b>Search Here by Telephone Number</b>
                            </div>
                            <div class="col-6">
                                <form action="" name="myForm" method="get" onsubmit="return validate()">
                                    <input type="text" name="search" placeholder="Search..." class="form-control"/>
                                    
                                </form> 
                               
                            </div>
                        </div>
                    </div>
                    
                        
                        
                       <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Telephone Number</th>
                                 <th scope="col">Email</th>
                                
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                            
                            <%
                             
						     
						     try
						     {
						    	 
						    	 //Class.forName("com.mysql.jdbc.Driver");
						    	
						    	 //con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
						    	  String Username2 = (String)request.getAttribute("theUserName");
						    	 stmt=con.createStatement();
						    	 String search=request.getParameter("search");
						    	 
						    	 String data1 = " SELECT TELENUM FROM USERLOGIN WHERE EMAIL='"+Username2+"' or TELENUM='"+Username2+"'" ;
						    	 
						    	 
						    	 RR = stmt.executeQuery(data1);
						    	 String query;
						    	if(search!=null)
						    	{
						    		 query = "SELECT * FROM USERLOGIN WHERE  TELENUM like'%"+search+"%' ";
						    		 
						    	}
						    	else{
						    		
						    		query="SELECT ID, NAME, TELENUM, EMAIL, STAGE FROM USERLOGIN";
						    	}
						    	 rs=stmt.executeQuery(query);
						    	 while(rs.next())
						    	 {
						          %>
						              <tr>
						                <td scope="row"> <%=Integer.parseInt(rs.getString("id"))%></td>
						                <td> <%=rs.getString("name") %></td>
						                <td> <%=Long.parseLong(rs.getString("telenum")) %></td>
						                 <td> <%=rs.getString("email") %></td>
						                
						                <td style="text-transform:uppercase"> <%=rs.getString("stage") %></td>
						                <td>
						                
						                    <%
						                    if(RR.next())
						                    {
						                    
						                    %>
		                                     <a href="./requestuser.jsp?id=<%=rs.getInt("id")%>" class="btn btn-sm bg-warning text-dark">Request to change stage?</a>
		                                     <%
		                                     }
						                    
						                    else
		                                     {
		                                     %>
		                                     
		                                    
		                                    <a href="./requestuser.jsp?id=<%=rs.getInt("id")%>" class="btn btn-sm bg-warning text-dark">Request to change stage?</a>
		                                   <%
		                                   
		                                   }%>
		                                    
		                                    
		                                </td>
						               </tr>
						        </tbody>
						        </table>
						
						    	  <%   
						    	 }
						    	 con.close();
						    	 }
						    	 catch(Exception e)
						    	 {
						    	 out.print(e);
						    	 }
						         %>
                              
                         
                          
                          
                    
                    <div class="card-footer">
                               <div class="bot">
                     <%         
                   //  private static final long passwordexpire = 30L * 24L * 60L * 60L * 1000L;
                                String Username1 = (String)request.getAttribute("theUserName");
                                
                               
                               
                                stmt1=con.createStatement();
                                 
                               // int uname = session.getAttribute("theUserName");
                              
                               
                                String data1 = "SELECT * FROM USERLOGIN WHERE EMAIL like '%"+Username1+"%' OR TELENUM like '%"+Username1+"%'";
                                
                                rs1=stmt1.executeQuery(data1); 
                                %>
                               <div class="login">
                                 <%
                                 if(rs1.next())
                                 {
                                	%>
                                	
                                	
                                	<p>please reset password<%=rs1.getString("passwordchange")%></p>
                                	<% 
                                 }
                                 else{
                                 %>
                                 <p>hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</p>
                                 <%} %>
                                 </div> 
                                 </div>         
                    
                    <a href="./login.jsp">
                                    <button class="btn btn-success float-right" onclick="return Validate()" style="background-color: #fb2525;">
                                       <p>Logout</p>
                                       
                                        <div>
            <%
            
           
    		PreparedStatement ps;
    		PreparedStatement ps1;
    		String sql2;
    		String Usernames = (String)request.getAttribute("theUserName");
    		String datas = "Select * from LASTLOGIN where USERNAME='"+Usernames+"'";
    		
    		try {
    			ps = con.prepareStatement(datas);
    			 Rs= ps.executeQuery(datas);
    			 
    			 if(Rs.next()) {
    					sql2= "UPDATE LASTLOGIN set LASTLOGINDATE = SYSTIMESTAMP where USERNAME=?";
    				}
    				else {
    					
    					sql2 = "INSERT INTO LASTLOGIN (USERNAME, LASTLOGINDATE) VALUES(?, SYSTIMESTAMP) ";
    				}
    			 ps1 = con.prepareStatement(sql2);
    				ps1.setString(1, Usernames);
    				int r1 = ps1.executeUpdate();
    		} catch (SQLException e1) {
    			// TODO Auto-generated catch block
    			e1.printStackTrace();
    		}
            
            %>
            </div>
                                       
                                  
                                       
                                       
                        </button>
                        </a>
                        
                         <a href="./resetpassword.jsp">
                                    <button class="btn btn-success float-right" onclick="return Validate()" style="background-color: #fb2525;">
                                       <p>Reset  Password</p>
                        </button>
                        </a>
                        
                        
                        
                        
                    </div>
                </div>
                
            </div>
           
        </div>
        
        
        
        
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
</body>
