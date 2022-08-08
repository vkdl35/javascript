package FAQ_pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQ_write extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FAQ_write() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String category = request.getParameter("select_category");
		String writer = request.getParameter("writer");
		String ftext = request.getParameter("ftext");
		String ftextarea = request.getParameter("ftextarea");
		String fview = request.getParameter("fview");
	
		timer tr =new timer();
		String fdate=tr.nowTime();
		insert_SQL is = new insert_SQL(category,writer,ftext,ftextarea,fdate,fview);
	
	
		try {
		String sign = is.insql().intern();
		if(sign=="ok") {
			pr.write("<script>alert('���ο� FAQ�� ��� �Ǿ����ϴ�.');location.href='./faq_write.html';</script>");
		}
		else {
			pr.write("<script>alert('DB���忡 ������ ������ϴ�.'); history.go(-1);</script>");
		}
		
		}
		catch(Exception e) {
			
		}
		
	}

}
