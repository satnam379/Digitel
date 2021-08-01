package com.DigiTel.Servlet.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Didgitel.Servlet.database.ResetPasswordDao;
import com.DigiTel.Servlet.bean.ResetPasswordBean;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/Reset")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final long passwordexpire = 30L * 24L * 60L * 60L * 1000L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("resetpassword.jsp");
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String telenum = request.getParameter("telenum");
		ResetPasswordBean resetPasswordBean = new ResetPasswordBean();
		
		resetPasswordBean.setEmail(email);
		resetPasswordBean.setPassword(password);
		resetPasswordBean.setNewpassword(newpassword);
		resetPasswordBean.setTelenum(telenum);
		
		ResetPasswordDao resetPasswordDao = new ResetPasswordDao();
		
		
		
			if(resetPasswordDao.ResetPassword(resetPasswordBean) !=0)
			{
//				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password Reset Successfully, click 'OK' to login again ');");
				 out.println("location='login.jsp';");
//			   
//			    out.println("</script>");
//				out.println("<script type=\"text/javascript\">");
//	        	   out.println("alert('Cannot Reset Password, Please check your Email/Telephone Number or Password');");
//	        	   out.println("window.location.href = \"resetpassword.jsp\";");
//	        	   
//	        	   out.println("</script>");
			response.sendRedirect("resetsuccess.jsp");
			}
			else {
				
				
				response.sendRedirect("errorjsp.jsp");
			}
		}
		
		
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("resetsuccess.jsp");
//		dispatcher.forward(request,response);
		
		
	}

