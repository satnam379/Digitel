package com.DigiTel.Servlet.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Didgitel.Servlet.database.RequestUserDao;
import com.DigiTel.Servlet.bean.LoginBean;
import com.DigiTel.Servlet.bean.RequestUserBean;

/**
 * Servlet implementation class RequestUserServlet
 */
@WebServlet("/RequestUsers")
public class RequestUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String telenum = request.getParameter("telenum");
		String stage = request.getParameter("stage");
		RequestUserBean requestUserBean = new RequestUserBean();
		String uname1 = (String)session.getAttribute("uname");
	
		String Username = (String)request.getAttribute("theUserName");
		String Usernamess = (String) getServletContext().getAttribute("theusername");
		
		
		
		requestUserBean.setName(name.toUpperCase());
		requestUserBean.setTelenum(telenum);
		requestUserBean.setStage(stage);
		requestUserBean.setUsername(uname1);
		
		RequestUserDao requestUserDao = new RequestUserDao();
		
		if(!(requestUserDao.ValidateTele(requestUserBean)))
		{
			requestUserDao.AddRequest(requestUserBean);
			out.println("<script type=\"text/javascript\">");
	     	   out.println("alert('Mobile number added Successfully');");
	     	   out.println("location='userdashboardview.jsp';");
	     	   out.println("</script>");
			
		}
		else {
			
			out.println("<script type=\"text/javascript\">");
     	   out.println("alert('this number alreday exist');");
     	   out.println("location='adduserrequest.jsp';");
     	   out.println("</script>");
		}
		
		doGet(request, response);
	}

}
