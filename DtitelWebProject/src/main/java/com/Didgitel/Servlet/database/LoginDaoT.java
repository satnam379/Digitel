package com.Didgitel.Servlet.database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.DigiTel.Servlet.bean.LoginBean;
import com.mysql.cj.protocol.Resultset;

public class LoginDaoT {
	public boolean validate(LoginBean loginBean) {
		boolean status = false;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/mydb", "satnam", "Satnam@123");
	        System.out.println(con);
	        Statement statement = con.createStatement();
//	        int result = statement.executeUpdate("insert into account values(1,'singh','satnam',50000)");
//	        System.out.println(result+"rows got inserted"); 
//	        int result = statement.executeUpdate("update account set bal = 100000 where accno = 1");
//	        System.out.println(result+"rows got updated"); 
//	        int result = statement.executeUpdate("delete from account where accno = 1");
//	        System.out.println(result+"rows got deleted"); 
//	        ResultSet rs= statement.executeQuery("select * from login where username = ? and password = ?");
//	        while(rs.next()) {
//	        	System.out.println(rs.getString(2));
//	        	System.out.println(rs.getString(3));
//	        	System.out.println(rs.getInt(4));
//	        	
//	        }
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			
//			e.printStackTrace();
//		}
	        
			
			String sql = "select * from login where username = ? and password = ?";
			PreparedStatement ps;
			
				ps = con.prepareStatement(sql);
				ps.setString(1, loginBean.getUsername());
				ps.setString(2, loginBean.getPassword());
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return status;
	
	}
	
	
}

	
