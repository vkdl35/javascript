package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class test4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public test4() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		/*
		String ad = request.getParameter("p").intern(); 
		PrintWriter pr = response.getWriter(); 
		System.out.println(ad); 
		if(ad=="도서상품권") {
			pr.print("<script>alert('해당 결제사항은 시스템 점검에 있습니다.'); history.go(-1)</script>");
		}
		*/

		int no = Integer.parseInt(request.getParameter("p"));
		PrintWriter pr = response.getWriter();
		switch (no) {
		case 0:
			//response.sendRedirect : 강제 페이지 이동
			response.sendRedirect("http://www.naver.com");
			break;
		case 1:
			break;
		case 2:	
			break;
		case 3:	
			pr.print("<script>alert('해당 결제사항은 시스템 점검에 있습니다.'); history.go(-1)</script>");
			break;
		case 4:	
			break;
		default:
			break;
		}
		
	}

}
