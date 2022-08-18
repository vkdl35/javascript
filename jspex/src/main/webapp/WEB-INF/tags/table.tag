<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import="java.sql.*"%>

<%
	Connection con = null;
	
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://umj7-009.cafe24.com/vkdl35";
		String user = "vkdl35";
		String userpw = "kalot854@91**";
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,userpw);
		//out.print("접속성공");
		
		String sql = "select * form poll order by pidx desc";
	try{
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			out.print(rs.getString("pid"));
		}
	}
	catch(Exception e){
		e.getMessage();
	}
%>