package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/index8")
public class index8 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pr = null;
    public index8() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 
		  숙제 
		  index8.html에서 id값을 전송 받아서 아이디 park 외에는 모두 "가입되지 않은 고객입니다." 라는 메세지 출력 및 전 페이지로 이동합니다. 
		  park으로 데이터를 전송 받을 경우 "로그인 되셨습니다." 라는 메세지와 함께 nate.com으로 이동합니다. 
		 */
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String m = request.getParameter("mid").intern();
		this.pr = response.getWriter();
		if(m=="") {
			this.pr.print("<script>alert('공백 입력 금지'); history.go(-1)</script>");
		}
		else if(m!="park"){	//아이디가 중복 되었을 때 ajax return
			this.pr.print("<script>alert('가입되지 않은 고객입니다.'); history.go(-1)</script>");
		}
		else {	//아이디가 중복되지 않았을 때 ajax return
			this.pr.print("<script>alert('로그인 되셨습니다.'); location.href='http://www.nate.com'</script>");
		}
	}

}
