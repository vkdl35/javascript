package FAQ_pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQ_update_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FAQ_update_OK() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		try {
			dbconfig db = new dbconfig();
			Connection con = db.cafe24();
			String idx = request.getParameter("fidx");
			String cate = request.getParameter("fcategoty");
			String text = request.getParameter("ftext");
			String textarea = request.getParameter("ftextarea");
			String sql = "update FAQ_Page set fcategory='"+cate+"',ftext='"+text+"',ftextarea='"+textarea+"' where fidx='"+idx+"'";
			PreparedStatement ps = con.prepareStatement(sql);
			int n = 0;
			n = ps.executeUpdate();
			if(n > 0) {
				pw.print("<script>alert('수정이 완료 되었습니다.'); location.href='./FAQ_list.html';</script>");
			}
			else {
				throw new Exception("error");
			}
			
		} catch (Exception e) {
			pw.print("<script>alert('올바른 접근이 아닙니다.'); history.go(-1);</script>");
		}
	}

}
