package configure;

import java.sql.*;

public class dbconfig {	//SQL 환경설정
	protected Connection dbcon() throws ClassNotFoundException, SQLException {
		
		String dbdriver = "com.mysql.jdbc.Driver";	//JAR 라이브러리
		/*
		String dburl = "jdbc:mysql://localhost:3306/webmail";
		String dbuser = "lkm";
		String dbpass = "940723";
		*/
		String dburl = "jdbc:mysql://localhost:3306/vkdl35";
		String dbuser = "vkdl35";
		String dbpass = "kalot854@91**";
		
		Class.forName(dbdriver);	//JDBC 클래스 로드명
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		
		return con;	
	}
}
