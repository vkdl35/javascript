package review_package;

import java.sql.*;
import java.util.ArrayList;

public class dataload {
	private String index_number;
	private String user_name;
	private String product_name;
	private String star;
	private String product_review;
	private String imgs;
	private String indate;
	
	//set Servlet에서 입력시키는 파트(인스턴스)
	public void setidx(String index_number) {
		this.index_number = index_number;
	}
	public void setusernm(String user_name) {
		this.user_name = user_name;
	}
	public void setpronm(String product_name) {
		this.product_name = product_name;
	}
	public void setstar(String star) {
		this.star = star;
	}
	public void setreview(String product_review) {
		this.product_review = product_review;
	}
	public void setimg(String imgs) {
		this.imgs = imgs;
	}
	public void setindate(String indate) {
		this.indate = indate;
	}
	
	//get JSP로 출력하기 위해서 사용
	public String getidx() {
		return this.index_number;
	}
	public String getusernm() {
		return this.user_name;
	}
	public String getpronm() {
		return this.product_name;
	}
	public String getstar() {
		return this.star;
	}
	public String getreview() {
		return this.product_review;
	}
	public String getimg() {
		return this.imgs;
	}
	public String getindate() {
		return this.indate;
	}
	
	public ArrayList<dataload> all_lists() {	//배열 자료형 메소드 형태
		ArrayList<dataload> list = new ArrayList<dataload>();	//배열 자료형 생성
		try {
			dbconfig db = new dbconfig();
			Connection ct = db.dbcon();
			String sql = "select * from pd_review";
			PreparedStatement ps = ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				dataload dl = new dataload();
				dl.setidx(rs.getString("index_number"));
				dl.setusernm(rs.getString("user_name"));
				dl.setpronm(rs.getString("product_name"));
				dl.setstar(rs.getString("star"));
				dl.setreview(rs.getString("product_review"));
				dl.setimg(rs.getString("imgs"));
				dl.setindate(rs.getString("indate"));
				list.add(dl);	//최종 DB 값을 받아서 배열로 처리
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;	//최종 DB 배열값을 return JSP에 적용
	}
}
