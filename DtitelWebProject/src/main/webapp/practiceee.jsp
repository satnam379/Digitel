<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 
                            <%
                             
						     
						     try
						     {
						    	 
						    	 //Class.forName("com.mysql.jdbc.Driver");
						    	
						    	 //con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
						    	 stmt=con.createStatement();
						    	 String search=request.getParameter("search");
						    	 String query;
						    	 
						    	 if(search!=null){
							    	  query = "SELECT * FROM USERREQUESTSS WHERE ID like '%"+search+"%' OR NAME like '%"+search.toUpperCase()+"%' OR NAME like '%"+search+"%' OR TELENUM like'%"+search+"%' ";
							    	 }
							    	 else{
							    	   query="SELECT ID, NAME, TELENUM, STAGE FROM USERREQUESTSS WHERE OWNER like'%"+Username+"%'";
							    	 }
						    	 rs1=stmt1.executeQuery(query);
						    	
						    	  query = "SELECT * FROM USERLOGIN WHERE  TELENUM like'%"+search+"%' ";
						    	  rs=stmt.executeQuery(query);
						    	  %>
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
						    	  do
						    	  {
						    		  %>
						    		  <tr>
						                <td scope="row"> <%=Integer.parseInt(rss.getString("id"))%></td>
						                <td> <%=rss.getString("name") %></td>
						                <td> <%=Long.parseLong(rss.getString("telenum")) %></td>
						                
						                
						                <td style="text-transform:uppercase"> <%=rss.getString("stage") %></td>
						                <td>
		                                   <a href="./requestuser.jsp?id=<%=rss.getInt("id")%>" class="btn btn-sm bg-warning text-dark">Request to change stage?</a>
		                                   
		                                </td>
						               </tr>
						           <% 
						    	 } while(rs.next());
						    	  %>
						    	  </tbody>
						    	  </table>
						    		      
						    	 
						    	   	<% 
						    	  
						    	 }
						    	 catch(Exception e)
						    	 {
						    	 out.print(e);
						    	 }
						         %>



</body>
</html>