package review_package;

import java.sql.*;

public class filedb {
	dbconfig db = null;
	Connection con = null;
	public filedb() {
		try {this.db = new dbconfig();
			this.con = this.db.dbcon();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void fileinsert(String fnm) throws ClassNotFoundException, SQLException{
		String sql = "insert into imgs (indx,imurl) values ('0','"+fnm+"')";
		PreparedStatement ps = this.con.prepareStatement(sql);
		int n = 0;
		n = ps.executeUpdate();
	}
}
