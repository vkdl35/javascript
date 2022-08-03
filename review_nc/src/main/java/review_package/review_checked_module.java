package review_package;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import java.sql.*;
public class review_checked_module {
	static String callsign = null;
	public void insert(ArrayList<String> datas) {
		try {
			System.out.println(datas);
			LocalDateTime time = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String today = time.format(dtf);
			dbconfig dc = new dbconfig();
			Connection ct = dc.dbcon();
			String sql = "insert into pd_review values('0',?,?,?,?,'"+today+"')";
			PreparedStatement ps = ct.prepareStatement(sql);
			ps.setString(1, datas.get(0));
			ps.setString(2, datas.get(1));
			ps.setString(3, datas.get(2));
			ps.setString(4, datas.get(3));		
			
			int n = 0;
			n = ps.executeUpdate();
			if(n > 0) {
				this.callsign = "ok";
			}
			else {
				throw new Exception("eroor");
			}
		} catch (Exception e) {
			this.callsign = "no";
		}
		
	}
	public String ck_msg() {
		return this.callsign;
	}
}
