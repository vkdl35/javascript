package ex;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex4.do")
public class ex4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ex4() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String tel = request.getParameter("usertel");
		response.setContentType("text/html; charset=utf-8");
		/* 5자리 인증번호 생성 후 회신 */
		if(tel==""||tel==null) {
			response.getWriter().print("error");
		}
		else {
			String no = "";
			int a;
			int w = 0;
			while(w < 5) {
				a = (int)(Math.random()*9);
				no += Integer.toString(a);
				w++;
			}
			System.out.println(no);
			response.getWriter().print(no);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
