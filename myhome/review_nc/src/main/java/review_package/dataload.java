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
	
	protected void setidx(String index_number) {
		this.index_number = index_number;
	}
	protected void setusernm(String user_name) {
		this.user_name = user_name;
	}
	protected void setpronm(String product_name) {
		this.product_name = product_name;
	}
	
	public String getidx(String index_number) {
		return this.index_number;
	}
	public String getusernm(String user_name) {
		return this.user_name;
	}
	public String getpronm(String product_name) {
		return this.product_name;
	}
	
	public ArrayList<dataload> all_list() {
		ArrayList<dataload> list = new ArrayList<>();
		try {
			dbconfig db = new dbconfig();
			Connection ct = db.dbcon();
			String sql = "select * from pd_review";
			PreparedStatement ps = ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				dataload dl = new dataload();
				dl.setidx(rs.getString("index_number"));
				dl.setidx(rs.getString("user_name"));
				dl.setidx(rs.getString("product_name"));
				list.add(dl);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
}
