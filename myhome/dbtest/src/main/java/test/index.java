package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public index() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	//Connection getConnection : SQL 연결되는 메소드 이름. (무조건 return) - 자료형
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		/* DB접속정보 */
		String dbconnect = "com.mysql.jdbc.Driver";
		//com.mysql.jdbc.Driver(5.x)  or  com.mysql.cj.jdbc.Driver(8.x) - Spring
		String dburl = "jdbc:mysql://localhost:3306/webmail";	//localhost(서버주소):3306(mysql port)/데이터베이스 이름
		String dbuser = "lkm";	//사용자 db 접속 아이디
		String dbpass = "940723";	//사용자 db 접속 비밀번호
		
		Class.forName(dbconnect);	//해당 정보 Class를 로드함
		Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
		//DriverManager.getConnection(연결주소, 사용자 아이디, 사용자 패스워드);
		return con;	//return 필수
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = getConnection();			
			System.out.println("연결 성공");
			String sql = "select * from shopmember";
			//con.createStatement();	//사용안함
			PreparedStatement ps = con.prepareStatement(sql);
			//프리페어드를 사용하는 이유는 데이터베이스 효율성을 높이기 위해서 사용하는 문법입니다.
			ResultSet rs = ps.executeQuery();
			//executeQuery : select문에서만 사용합니다. (ResultSet)
			int a = 0;
			while(rs.next()) {	//next() 데이터베이스 전체 리스트값
				String user = rs.getString("suser");	//getString 컬럼명를 사용
				//String pass = rs.getString("spasswd");
				System.out.println(user);
			}
			
		} catch (Exception e) {
			System.out.println("연결 실패");
		}
		
	}

}
