package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

//@WebServlet 사용시 web.xml에는 절대 추가하면 안됨
@WebServlet("/ex2.do")
public class ex2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ex2() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String id = request.getParameter("mid");
		String pw = request.getParameter("mpass");
		//intern은 checkbox, radio는 사용하지 않음
		String msex = request.getParameter("msex");
		String sms = request.getParameter("sms");
		if(sms==null) {
			sms="N";
		}
		pr.print(id+"<br>");
		pr.print(pw+"<br>");
		pr.print(msex+"<br>");
		pr.print(sms+"<br>");
	}

}
