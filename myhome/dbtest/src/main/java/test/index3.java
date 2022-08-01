package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;


public class index3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected PrintWriter pr = null;
	protected Connection con = null;
	protected LocalDateTime now = null;
	String mname,mid,mpw,memail;
	

	
    public index3() {
    	try {
    		dbconnet db = new dbconnet();
        	this.con = db.ct();
        	
		} catch (Exception e) {

			e.getMessage();
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.mname = request.getParameter("join_nm");
		this.mid = request.getParameter("join_id");
		this.mpw = request.getParameter("join_pw");
		this.memail = request.getParameter("join_email");
		
		/*	//datetime 컬럼값으로 설정할 경우
		this.now = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		*/
		
		//current timestamp 컬럼값으로 설정할 경우
		Date date = new Date();
		long time = date.getTime();
		java.sql.Timestamp ts = new java.sql.Timestamp(time);
		System.out.println(ts);
		
		//String today = this.now.format(df);
	
		int point = 1000;
		/*auto_increment 컬럼값도 적용해야합니다.*/
		
		String sql = "insert into joinmember (jidx,jname,jid,jpw,jemail,jpoint,jdate) values ('0','"+this.mname+"','"+this.mid+"','"+this.mpw+"','"+this.memail+"','"+point+"','"+ts+"')";
		// ? 로 표시할 경우 무조건 물음표는 1부터 시작합니다.
			
		//System.out.println(sql);
		try {
			PreparedStatement pr = this.con.prepareStatement(sql);	
			int oksign = 0;
			//executeUpdate : insert, update, delete 에서만 사용
			oksign = pr.executeUpdate();
			//정확하게 저장될 경우 oksign은 무조건 +1이 작동됩니다.
			
			response.setContentType("text/html; Charset=utf-8");
			this.pr = response.getWriter();
			if(oksign > 0) {
				this.pr.write("회원가입이 정상적으로 진행되었습니다.");
			}
			else {
				this.pr.write("DB 컬럼에 문제가 발생하였습니다.");
			}
			
		} catch (Exception e) {
			
		}
		
		
		
	}

}
