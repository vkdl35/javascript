package FAQ_pack;

import java.sql.*;

public class dbconfig {
	static String dbdriver = "com.mysql.jdbc.Driver";
	static String dburl = null;
	static String dbuser = null;
	static String dbpass = null;

	public static Connection cafe24() throws ClassNotFoundException, SQLException {
		dburl = "jdbc:mysql://umj7-009.cafe24.com/vkdl35";
		dbuser = "vkdl35";
		dbpass = "kalot854@91**";
		
		Class.forName(dbdriver); 
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		return con;

	}

	public static Connection kbsn() throws ClassNotFoundException, SQLException {
		dburl = "jdbc:mysql://localhost:3306/vkdl35";
		dbuser = "vkdl35";
		dbpass = "kalot854@91**";
		
		Class.forName(dbdriver);
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		return con;
	}

}