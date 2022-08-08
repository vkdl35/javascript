package FAQ_pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQ_view extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FAQ_view() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
			dbconfig db = new dbconfig();
			Connection con = db.cafe24();
			String idx = request.getParameter("idx");
			String aql = "select * from FAQ_Page where fidx='"+idx+"'";
			PreparedStatement ps = con.prepareStatement(aql);
			ResultSet rs = ps.executeQuery();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter pw = response.getWriter();
			//rs.next() : buffer와 동일하게 한번 코드 입력시 값이 소멸합니다.
			if(rs.next()==false) {	//count로 값을 확입합니다. 단, select 에 대한 where 부분에 db값이 없을 경우 
				pw.write("<script>alert('올바른 접근이 아닙니다.'); history.go(-1);</script>");
			}
			else {
			
				PreparedStatement ps2 = con.prepareStatement(aql);
				ResultSet rs2 = ps2.executeQuery();
				
				String fidx = null;
				String fcategory = null;
				String fname = null;
				String ftext = null;
				String ftextarea = null;
				String fsecret = null;
				while(rs.next()) {
					fidx=rs.getString("fidx");
					fcategory=rs.getString("fcategory");
					fname=rs.getString("fname");
					ftext=rs.getString("ftext");
					ftextarea=rs.getString("ftextarea");
					fsecret =rs.getString("fsecret");
				}
				
				//System.out.println(fname);
				response.setContentType("text/html; charset=utf-8"); 
				request.setAttribute("fidx", fidx);
				request.setAttribute("fcategory", fcategory);
				request.setAttribute("fname", fname);
				request.setAttribute("ftext", ftext);
				request.setAttribute("ftextarea", ftextarea);
				request.setAttribute("fsecret", fsecret);
				PrintWriter pr = response.getWriter();
				RequestDispatcher rd = request.getRequestDispatcher("/FAQ_view.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
