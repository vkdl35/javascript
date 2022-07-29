package ex;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex3.do")
public class ex3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ex3() {

    }

	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getRequestDispatcher : servlet에서 해당 파일을 로드할 때 사용합니다. forward (요청,답변)
		request.getRequestDispatcher("./ex3.html").forward(request, response);
		request.setCharacterEncoding("utf-8");

		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpass");
		
		System.out.println(mid + mpw);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
