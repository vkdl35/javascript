package review_package;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class review_checked extends HttpServlet {
	String username, proname, star, proreview;
	private static final long serialVersionUID = 1L;
       
    public review_checked() {

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		this.username = request.getParameter("user_name");
		this.proname = request.getParameter("product_name");
		this.star = request.getParameter("star");
		this.proreview = request.getParameter("review_box");
		
		review_checked_module jm = new review_checked_module();
		ArrayList<String> list = new ArrayList<String>();
		list.add(username);
		list.add(proname);
		list.add(star);
		list.add(proreview);
		jm.insert(list);
		
		String r = jm.ck_msg().intern();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		if(r=="ok") {
			pr.print("<script>alert('게시판에 글이 등록되었습니다.'); location.href='./review_write.html';</script>");
		}
		else {
			pr.print("<script>alert('데이터가 올바르지 않습니다.'); location.href='./review_write.html';</script>");
		}
	}

}
