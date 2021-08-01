<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
String id=request.getParameter("id");
out.println(id);
//int id = Integer.parseInt(request.getParameter("user_id"));
//int u_id =Integer.parseInt(id);
//Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "satnam", "test");				    	 
Statement st=conn.createStatement();
int i = st.executeUpdate("DELETE FROM REQUESTUSERS WHERE ID='"+id+"'");
//st.executeUpdate("DELETE FROM digitnew WHERE user_id='"+Integer.valueOf(id)+"'");
//response.sendRedirect("./Dashboard.jsp");
if(i!=0){
	out.println("<script type=\"text/javascript\">");
    out.println("alert('User has been deleted successfully!');");
   
    out.println("</script>");
	//response.sendRedirect("./Dashboard.jsp");
}
else{
	out.println("Error occured");
}

%>
</body>
</html>