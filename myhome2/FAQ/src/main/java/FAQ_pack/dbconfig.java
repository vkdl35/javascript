package FAQ_pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconfig {

	static String dburl = null;
	static String dbuser = null;
	static String dbpass = null;

	public static Connection cafe24() throws ClassNotFoundException, SQLException {
		String dbdriver = "com.mysql.jdbc.Driver";
		//dburl = "jdbc:mysql://umj7-009.cafe24.com/vkdl35";
		dburl = "jdbc:mysql://localhost:3306/vkdl35";
		dbuser = "vkdl35";
		dbpass = "kalot854@91**";
		Class.forName(dbdriver); 
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		return con;

	}

	public static Connection kbsn() throws ClassNotFoundException, SQLException {
		dburl = "jdbc:mysql://kbsn.or.kr:3306/classa";
		return null;
	}

}