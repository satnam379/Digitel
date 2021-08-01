package com.Didgitel.Servlet.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.DigiTel.Servlet.bean.AddUserBean;
import com.DigiTel.Servlet.bean.LoginBean;



public class AddUserDao {
//	private String DbUrl = "jdbc:mysql://localhost:/mydb";
//	private String DbUser ="satnam";
//	private String DbPassword = "Satnam@123";
//	private String DbDriver = "com.mysql.jdbc.Driver";
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
	
	public int AddUser(AddUserBean addUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
//		String sql1 = "INSERT INTO userlogin" +  " VALUES(?, ?, ?, ?);";
		String sql = " INSERT INTO USERLOGIN " + " (NAME, TELENUM, EMAIL, PASSWORD, PASSWORDCHANGE) VALUES " + " (?, ?, ?, ?, SYSTIMESTAMP) ";
	//	String sql1 = "update USERLOGIN set NAME = ?, TELENUM = ?, EMAIL = ?, PASSWORD = ? ,STAGE = ? where EMAIL = ? and PASSWORD = ? ";
//		String sql = " INSERT INTO userlogin (name, telenum, email, stage) VALUES  (?, ?, ?, ?) ";
		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getName());
			ps.setString(2, addUserBean.getTelenum());
			ps.setString(3, addUserBean.getEmail());
			ps.setString(4, addUserBean.getPassword());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public int AddAdmin(AddUserBean addUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		
//		String sql1 = "INSERT INTO userlogin" +  " VALUES(?, ?, ?, ?);";
		String sql = " INSERT INTO ADMINLOGIN " + " (NAME, TELENUM, EMAIL, PASSWORD) VALUES " + " (?, ?, ?, ?) ";
		//String sql1 = "update ADMINLOGIN set NAME = ?, TELENUM = ?, EMAIL = ?, PASSWORD = ? ,STAGE = ? where EMAIL = ? and PASSWORD = ? ";
//		String sql = " INSERT INTO userlogin (name, telenum, email, stage) VALUES  (?, ?, ?, ?) ";
		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getName());
			ps.setString(2, addUserBean.getTelenum());
			ps.setString(3, addUserBean.getEmail());
			ps.setString(4, addUserBean.getPassword());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public boolean UpdateUser(AddUserBean addUserBean) throws SQLException
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "update USERLOGIN set NAME = ?, TELENUM = ?, EMAIL = ?, PASSWORD = ? ,STAGE = ? where EMAIL = ? and PASSWORD = ? ";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getName());
			ps.setString(2, addUserBean.getTelenum());
			ps.setString(3, addUserBean.getEmail());
			ps.setString(4, addUserBean.getStage());
			ps.setString(4, addUserBean.getStage());
			ps.setString(5, addUserBean.getPassword());
			status = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	
	public boolean ValidateEmail(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from USERLOGIN where EMAIL=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getEmail());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	public boolean ValidateTele(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from USERLOGIN where TELENUM=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getTelenum());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

	public boolean ValidateAdminEmail(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from ADMINLOGIN where EMAIL=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getEmail());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	public boolean ValidateAdminTele(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from ADMINLOGIN where TELENUM = ?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getTelenum());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

}
