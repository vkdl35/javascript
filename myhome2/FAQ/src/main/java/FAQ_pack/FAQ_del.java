package FAQ_pack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQ_del extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FAQ_del() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String idx = request.getParameter("idx");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		
		if(idx==null || idx=="") {
			pr.write("<script>alert('올바른 접근이 아닙니다.'); history.go(-1);</script>");
		}
		else {
			delete_SQL ds = new delete_SQL();
			String msg = ds.delfaq(idx).intern();
			if(msg=="ok") {
				pr.write("<script>alert('데이터가 정상적으로 삭제 되었습니다.'); location.href='./FAQ_list.html';</script>");
			}
			else {
				pr.write("<script>alert('올바른 DB가 아닙니다.'); history.go(-1);</script>");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
