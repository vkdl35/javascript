package review_package;

import java.sql.*;

public class dbconfig {
	protected Connection dbcon() throws ClassNotFoundException, SQLException {
		
		String dbdriver = "com.mysql.jdbc.Driver";
		String dburl = "jdbc:mysql://localhost:3306/vkdl35";
		String dbuser = "vkdl35";
		String dbpass = "kalot854@91**";
		
		Class.forName(dbdriver);
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		return con;
	}
}
