package test;
import java.sql.*;

public class dbconnet {
	public static Connection ct() throws ClassNotFoundException, SQLException {
		
		String dbdrive = "com.mysql.jdbc.Driver";
		String dburl = "jdbc:mysql://localhost:3306/webmail";
		String dbuser = "lkm";
		String dbpw = "940723";

		Class.forName(dbdrive);
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpw);
		
		return con;
	}
}
