package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ex1() {

    }

	public void init(ServletConfig config) throws ServletException {

	}
	//파라미터 전송 & 사용자가 URL을 직접 입력했을 때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request : Front에게서 받는 데이터
		//response : backend가 출력하는 데이터
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String a = request.getParameter("cal");
		String b = request.getParameter("cal2");
		String job = request.getParameter("job");

		pr.print("<html lang='ko'><head><meta charset='UTF-8'></head><body><p>결과값 출력 : "+a+"</p><br><p>결과값 출력2 : "+b+"</p><br><p>선택하신 직업군은 : "+job+"입니다.</p></body></html>");
	}
	//FORM & AJAX(POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
