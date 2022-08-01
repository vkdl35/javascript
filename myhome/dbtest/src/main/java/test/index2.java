package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;



public class index2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public index2() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* DB Connect 부분은 별도 java를 생성하여 지속적으로 로드할 수 있도록 적용합니다. */
		try {
			dbconnet db = new dbconnet();
			Connection con = db.ct();
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			String mid = request.getParameter("mid");
			//select * from : 세그먼트 문법
			//'"+mid+"' : 일반 세그먼트 방식
			// ? : 프리페어더 세그먼트 방식
			
			
			//String sql = "select * from shopmember where suser='"+mid+"'";
			String sql = "select * from shopmember where suser=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,mid);	
			//setString : 값을 대입시킬 때 사용
			//getString : 값을 가져올 때 사용
			ResultSet rs = ps.executeQuery();
			PrintWriter pr = response.getWriter();
			while(rs.next()) {
				String user = rs.getString("suser");
				String userpw = rs.getString("spasswd");
				pr.print("해당 정보를 확인했습니다.<br>아이디 : "+user+"<br>패스워드 : "+userpw);
			}
			
			//db = null;
			//con.close();	//DB접속 종료 (외부 class 사용시에만 적용)
			/*Servlet에는 무조건 한번만 작동됨*/
			
		} catch (Exception e) {
			//e.getMessage();
			System.out.println("DB연결실패");
		}
		
	}

}
