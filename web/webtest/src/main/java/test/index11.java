package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class index11 extends HttpServlet {
	static String mm;
	private static final long serialVersionUID = 1L;

    public index11() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		String mid = request.getParameter("mid");
		String key = request.getParameter("key").intern();
		if(key!="abcdef") {
			this.mm = null;
			pr.print("error"+this.mm);
		}
		else {			
			this.mm = mid;
			pr.print(mid);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
