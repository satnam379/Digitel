package com.satnam.login;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class login {
	
public static Connection connection;
	
	
	static {
	try {
	Class.forName("oracle.jdbc.OracleDriver");		
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SATNAM", "test");
//	System.out.println("Driver is connected");
//	Statement statement = connection .createStatement();
//	int result = statement.executeUpdate("INSERT INTO digitnew values (11, 'S.Kumar', 9876543218, 'ACTIVE','Cr3r')");
//	System.out.println(result+" rows got inserted");
	
	}
			
	catch(SQLException | ClassNotFoundException e) {
		e.printStackTrace();
	}
	}

public static Connection getConnection() {
	return connection;
}

}
