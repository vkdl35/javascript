package FAQ_pack;

import java.sql.*;
import java.util.ArrayList;

public class select_SQL {
	private String fidx = null;
	private String fcategory = null;
	private String fname = null;
	private String ftext = null;
	private String fdate = null;
	private String fview = null;

	public String getFidx() {
		return fidx;
	}

	public void setFidx(String fidx) {
		this.fidx = fidx;
	}

	public String getFcategory() {
		return fcategory;
	}

	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}

	public String getFtext() {
		return ftext;
	}

	public void setFtext(String ftext) {
		this.ftext = ftext;
	}

	public String getfname() {
		return fname;
	}

	public void setfname(String fname) {
		this.fname = fname;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	public String getFview() {
		return fview;
	}

	public void setFview(String fview) {
		this.fview = fview;
	}

	public ArrayList<select_SQL> viewdata() throws ClassNotFoundException, SQLException {
		ArrayList<select_SQL> list = new ArrayList<select_SQL>();
		dbconfig db = new dbconfig();
		Connection con = db.cafe24();
	
		String sql = "select * from FAQ_Page order by fdate desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			select_SQL ss = new select_SQL();
			ss.setFidx(rs.getString("fidx"));
			ss.setFcategory(rs.getString("fcategory"));
			ss.setfname(rs.getString("fname"));
			ss.setFtext(rs.getString("ftext"));
			ss.setFdate(rs.getString("fdate"));
			ss.setFview(rs.getString("fsecret"));
			list.add(ss);
		}
		return list;
	}
}
