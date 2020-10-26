package com.hanshin.capstoneProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

public class DBConn {


	public static Connection getMySqlConnection(){
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			
			String jdbc_url = "jdbc:mysql://61.98.4.133:3306/project?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbc_url, "hyunbin", "1234");		
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		return conn;
	}
		
}
