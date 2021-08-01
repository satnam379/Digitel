<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@ page import = "java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
int j =0;
String id=request.getParameter("id");
String email=request.getParameter("email");
String telenum=request.getParameter("telenum");

String c = request.getParameter("telenum");
String d = request.getParameter("email");
out.println(id);
//int id = Integer.parseInt(request.getParameter("user_id"));
//int u_id =Integer.parseInt(id);
//Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "satnam", "test");				    	 
Statement st=conn.createStatement();
PreparedStatement ps = null;

int i = st.executeUpdate("DELETE FROM USERREQUEST WHERE ID='"+id+"'");
// String query3 = "DELETE FROM REQUESTUSERS WHERE TELENUM='"+c+"'";
// ps = conn.prepareStatement(query3);
j = ps.executeUpdate();
//st.executeUpdate("DELETE FROM digitnew WHERE user_id='"+Integer.valueOf(id)+"'");
//response.sendRedirect("./Dashboard.jsp");
if(i>0){
	out.println("<script type=\"text/javascript\">");
    out.println("alert('User has been deleted successfully!');");
    out.println("window.location.href = \"userdashboardview.jsp\";");
    out.println("</script>");
	//response.sendRedirect("./Dashboard.jsp");
}
else{
	out.println("Error occured");
}

%>
</body>
</html>