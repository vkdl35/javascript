package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/index7")
public class index7 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
       
    public index7() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String a = request.getParameter("u1").intern();
		String b = request.getParameter("u2").intern();
		pr = response.getWriter();
		
		if(a=="") {
			pr.print("<script>alert('접근 오류'); history.go(-1)</script>");
		}
		else if(a!="kim"){
			pr.print("<script>alert('회원정보를 다시 확인하세요.'); history.go(-1)</script>");
		}
		else {
			if(b!="a123456") {
				pr.print("<script>alert('회원정보를 다시 확인하세요.'); history.go(-1)</script>");
			}
			else {
				pr.print("<script>alert('확인'); location.href='./index6.html'</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
