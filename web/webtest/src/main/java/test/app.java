package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class app extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public app() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String num = request.getParameter("num").intern();
		int num2 = Integer.parseInt(num);
		int a = (int)(Math.random()*10)+1;
		if(num2==a) {
			pr.print("당첨");
		}
		else {
			pr.print("다음 기회에");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
