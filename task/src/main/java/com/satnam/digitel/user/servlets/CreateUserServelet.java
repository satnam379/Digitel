package com.satnam.digitel.user.servlets;
import java.io.IOException;
import java.io.PrintWriter;


import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connectionDb.ConnectionDb;
//import java.util.Random;
/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/addUserServlet")

public class CreateUserServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Connection connection = ConnectionDb.getConnection();
		String name = request.getParameter("name");
		long tel_number = Long.parseLong(request.getParameter("tel_number"));
		String step = request.getParameter("step");
		//String password = "C1234";
		//RandomPwdGenerator pwd = new RandomPwdGenerator();
		//String password = RandomPwdGenerator.randomPWD;
		
		/**
		 * Random password function from RandomPwdGenerator class
		 *
		 */
		 RandomPasswordGenerater pwd = new RandomPasswordGenerater();
		String password = pwd.generateRandomChars("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz#$%!@*()^",8);
		
		/**
		 * 
		 * Random userid creation field
		 */
		
		
		//Random u=new Random();
		//int user_id=100+u.nextInt(899);
		
		int user_id=1000; 
		
		
		/**
		 * Incrementing User id sending data to database.
		 */
		PreparedStatement pi=connection.prepareStatement("select max(user_id) from digitel");
		ResultSet rs=pi.executeQuery();
		
		
		
		if(rs.next()) {
			user_id=rs.getInt(1);
			user_id++;
			
			PreparedStatement ps=connection.prepareStatement("insert into digitel values(?,?,?,?,?)");
			ps.setInt(1, user_id);
			ps.setString(2, name);
			ps.setLong(3, tel_number);
			ps.setString(4, step);
			ps.setString(5, password);
			
			int i=ps.executeUpdate();
			
			if(i>0) {
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('New user has been successfully added!');");
				pw.println("window.location.href = \"Dashboard.jsp\";");
				pw.println("</script>");
				//RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				//rd.include(request, response);
				//request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		
		
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}
