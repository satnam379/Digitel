package com.Didgitel.Servlet.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import com.DigiTel.Servlet.bean.AddUserBean;
import com.DigiTel.Servlet.bean.LoginBean;
import com.DigiTel.Servlet.bean.RequestUserBean;
public class RequestUserDao {
	private String DbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	private String DbUser ="satnam";
	private String DbPassword = "test";
	private String DbDriver = "oracle.jdbc.driver.OracleDriver";
	
	
	Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    String currentDate = dateFormat.format(date);
	
	
	public void loadDriver(String DbDriver)
	{
		try {
			Class.forName(DbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(DbUrl, DbUser, DbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	public int AddRequest(RequestUserBean requestUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		
		// String Username = (String)request.getAttribute("theUserName");
//		String sql1 = "INSERT INTO userlogin" +  " VALUES(?, ?, ?, ?);";
		String sql = " INSERT INTO USERREQUESTSS " + " (NAME, TELENUM, STAGE, OWNER) VALUES " + " (?, ?, ?, ?) ";
	//	String sql1 = "update USERLOGIN set NAME = ?, TELENUM = ?, EMAIL = ?, PASSWORD = ? ,STAGE = ? where EMAIL = ? and PASSWORD = ? ";
//		String sql = " INSERT INTO userlogin (name, telenum, email, stage) VALUES  (?, ?, ?, ?) ";
		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, requestUserBean.getName());
			ps.setString(2, requestUserBean.getTelenum());
			ps.setString(3, requestUserBean.getStage());
			ps.setString(4, requestUserBean.getUsername());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;

}
	
	public boolean ValidateTele(RequestUserBean requestUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from USERREQUESTSS where TELENUM=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, requestUserBean.getTelenum());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

}
	
	
	
	
	
	
	
	
	
	