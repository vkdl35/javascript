package FAQ_pack;

import java.sql.*;

public class delete_SQL {
	String msg = null;
	Connection ct = null;
	dbconfig db = null;
	public String delfaq(String idx) {
		try {
			db = new dbconfig();
			ct = db.cafe24();
			String sql = "delete from FAQ_Page where fidx='"+idx+"'";
			PreparedStatement ps = ct.prepareStatement(sql);
			int n = 0;
			n = ps.executeUpdate();
			
			if(n > 0) {
				this.msg = "ok";
			}
			else {
				throw new Exception("error");
			}
		} catch (Exception e) {
			this.msg = "no";
		}
		finally {
			try {
				ct.close();
			} catch (Exception e2) {
				System.exit(0);
			}
		}
		
		
		return null;
	}
}
