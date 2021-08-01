package com.DigiTel.Servlet.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Didgitel.Servlet.database.AddUserDao;
import com.Didgitel.Servlet.database.LoginDao;
import com.DigiTel.Servlet.bean.AddUserBean;


/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddUser.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String telenum = request.getParameter("telenum");
		String email  = request.getParameter("email");
		String stage = request.getParameter("stage");
		String password = request.getParameter("password");
		AddUserBean addUserBean = new AddUserBean();
		addUserBean.setName(name.toUpperCase());
		addUserBean.setTelenum(telenum);
		addUserBean.setEmail(email);
		addUserBean.setStage(stage);
		addUserBean.setPassword(password);
		
		AddUserDao addUserDao = new AddUserDao();
		
//		if(addUserDao.ValidateAdminTele(addUserBean))
//		{
//			
//			out.println("<script type=\"text/javascript\"> alert(' Admin with this Telephone Number,already exist'); location='AddUser.jsp';");
////	     	   out.println("alert('Duplicate entry');");
////	     	  out.println("location='Dashboard.jsp';");
//			
//	     	   
//	     	   out.println("</script>");
//		}
//		else if(addUserDao.ValidateAdminEmail(addUserBean)) {
//			out.println("<script type=\"text/javascript\"> alert('Admin with this Email,already exist'); location='AddUser.jsp';");
////     	   out.println("alert('Duplicate entry');");
////     	  out.println("location='Dashboard.jsp';");
//     	   
//     	   out.println("</script>");
//     	  
//		}
		
		if(addUserDao.ValidateTele(addUserBean))
		{
			out.println("<script type=\"text/javascript\"> alert('User with this Telephone Number ,already exist'); location='AddUser.jsp';");
//	     	   out.println("alert('Duplicate entry');");
//	     	  out.println("location='Dashboard.jsp';");
	     	   
	     	   out.println("</script>");
		}
		
		else if(addUserDao.ValidateEmail(addUserBean))
		{
			out.println("<script type=\"text/javascript\"> alert('User with this Email ,already exist'); location='AddUser.jsp';");
//	     	   out.println("alert('Duplicate entry');");
//	     	  out.println("location='Dashboard.jsp';");
	     	   
	     	   out.println("</script>");
		}
		
		
		else {
			
		
		
        if(addUserDao.AddUser(addUserBean)!=0)
        {
        	
//        	RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");
//    		dispatcher.forward(request,response);
        	   out.println("<script type=\"text/javascript\">");
        	   out.println("alert('User created Successfully');");
        	   out.println("location='Dashboard.jsp';");
        	   out.println("</script>");
        }
        else  if(addUserDao.AddAdmin(addUserBean)!=0)
        {
        	
		   out.println("<script type=\"text/javascript\">");
      	   out.println("alert('Admin created Successfully');");
      	   out.println("location='loginSuccess.jsp';");
      	   out.println("</script>");
        }
        
		}
       
		
		
//		response.sendRedirect("adduserdetail.jsp");
		
		
	}

}
