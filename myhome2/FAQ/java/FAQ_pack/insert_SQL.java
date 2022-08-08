package FAQ_pack;

import java.sql.*;

public class insert_SQL {
	String fcategory = null;
	String fname = null;
	String ftext = null;
	String ftextarea = null;
	String fsecret = null;
	String fdate = null;

	public insert_SQL(String fcategory, String fname, String ftext, String ftextarea, String fdate, String fsecret) {

		this.fcategory = fcategory;
		this.fname = fname;
		this.ftext = ftext;
		this.ftextarea = ftextarea;
		this.fdate = fdate;
		this.fsecret = fsecret;

	}

	public String insql() throws ClassNotFoundException, SQLException {
		dbconfig db = new dbconfig();
		Connection ct = db.cafe24();
		
		String sql = "insert into FAQ_Page values ('0',?,?,?,?,?,?)";
		
		
		PreparedStatement ps = ct.prepareStatement(sql);
		ps.setString(1, this.fcategory);
		ps.setString(2, this.fname);
		ps.setString(3, this.ftext);
		ps.setString(4, this.ftextarea);
		ps.setString(5, this.fdate);
		ps.setString(6, this.fsecret);
		
		int n = 0;
		n = ps.executeUpdate();
		String msg = null;
		if (n > 0) {
			msg = "ok";
		}
		else {
			msg = "no";
		}
		return msg;
	}
}
