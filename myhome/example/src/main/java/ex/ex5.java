package ex;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex5.do")
public class ex5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ex5() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email").intern();
		//System.out.println(email);
		if(email==null || email=="") {
			response.getWriter().print("error");
		}
		else {
			if(email.indexOf("@")==-1) {
				response.getWriter().print("error");
			}
			else {
				response.getWriter().print("ok");
			}
		}
	}

}
