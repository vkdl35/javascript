package configure;

import java.sql.*;

//MVC : 모듈 파트

public class loginok_module {
	protected Connection ct = null;
	String u = null;
	String n = null;
	String msg = null;
	
	/*
	public void userinfo(String userid, String userpw) {
		this.u = userid;
		this.p = userpw;				
	}
	*/
	
	public void user(String userid) {
		this.u = userid;
	}
	public void username(String usernm) {
		this.n = usernm;		
	}
	public void message(String message) {
		this.msg = message;
	}
	
	//클래스 형태의 메소드 getter, setter 사용이유는 자료형 구분 없이 사용하기 위함
	public loginok_module getter(String userid, String usernm) {	//getter return
		loginok_module ld = null;
		
		try {
			dbconfig dc = new dbconfig();
			this.ct = dc.dbcon();
			ld = new loginok_module();	//class 인스턴스 적용
			/*
			  !중요 
			  sql 문법은 해당 값이 잘못되었을 경우, 또는 필드명이 잘못될 경우 
			  해당 문법 세그먼트를 직접 찍어서 확인해야합니다.
			  암호화가 있을 경우 무조건 암호화 값이 들어가야만 확인이 정상적으로 이루어집니다.
			  
			  해당 필드값만 가져와서 사용할 경우, 각각의 필드명을 입력하면 됩니다.
			 */
			String sql = "select mid,mpass,mname from person where mid=? and mpass=?";
			PreparedStatement ps = this.ct.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, usernm);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			if(rs.next()==false) {
				ld.message("nojoin");
			}
			else {
				System.out.println(rs.getString("mid"));
				System.out.println(rs.getString("mname"));
				ld.message("okjoin");
			}
			
			//void 메소드로 this를 적용시켜줌, loginok.java에서 this값을 바로 로드하기 위함
			ld.user(userid);	
			ld.username(rs.getString("mname"));
			
		} catch (Exception e) {
			
		}
		return ld;
		
	}
}
