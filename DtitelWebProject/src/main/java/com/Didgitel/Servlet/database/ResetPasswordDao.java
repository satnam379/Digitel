package com.Didgitel.Servlet.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DigiTel.Servlet.bean.LoginBean;
import com.DigiTel.Servlet.bean.ResetPasswordBean;

public class ResetPasswordDao {
	
//		private String DbUrl = "jdbc:mysql://localhost:/mydb";
//		private String DbUser ="satnam";
//		private String DbPassword = "Satnam@123";
//		private String DbDriver = "com.mysql.jdbc.Driver";
		private String DbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		private String DbUser ="satnam";
		private String DbPassword = "test";
		private String DbDriver = "oracle.jdbc.driver.OracleDriver";
		private static final long expiration = 60L;
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
		public boolean validate(ResetPasswordBean resetPasswordBean) {
			// TODO Auto-generated method stub
			loadDriver(DbDriver);
			Connection con = getConnection();
			boolean status = false;
			
			String sql = "select EMAIL, PASSWORD from USERLOGIN where EMAIL = ? and PASSWORD = ? and TELENUM = ?";
			PreparedStatement ps;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, resetPasswordBean.getEmail());
				ps.setString(2, resetPasswordBean.getPassword());
				ps.setString(3, resetPasswordBean.getTelenum());
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return status;
			
		}
		
		public int ResetPassword(ResetPasswordBean resetPasswordBean) {
			// TODO Auto-generated method stub
			
			loadDriver(DbDriver);
			Connection con = getConnection();
			boolean status = false;
			int rs = 0;
			if(validate(resetPasswordBean))
			{
			String sql = "update USERLOGIN set PASSWORD = ?, PASSWORDCHANGE = SYSTIMESTAMP where EMAIL = ? and PASSWORD = ? and TELENUM = ?";
//			String sql = "select EMAIL, PASSWORD from USERLOGIN where EMAIL = ? and PASSWORD = ?";
			
			PreparedStatement ps;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(2, resetPasswordBean.getEmail());
				ps.setString(4, resetPasswordBean.getTelenum());
				ps.setString(3, resetPasswordBean.getPassword());
				ps.setString(1, resetPasswordBean.getNewpassword());
			rs = ps.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			return rs;
			
		}
		public String expire(ResetPasswordBean resetPasswordBean) {
			// TODO Auto-generated method stub
			loadDriver(DbDriver);
			Connection con = getConnection();
			
			String xy = "";
			
			String sql = "select PASSWORDCHANGE from USERLOGIN where EMAIL = ? and PASSWORD = ? and TELENUM = ?";
			PreparedStatement ps;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, resetPasswordBean.getEmail());
				ps.setString(2, resetPasswordBean.getPassword());
				ps.setString(3, resetPasswordBean.getTelenum());
			ResultSet rs = ps.executeQuery();
			 xy = rs.getString("passwordchange");
			
			 rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return xy;
			
		}
		


}
