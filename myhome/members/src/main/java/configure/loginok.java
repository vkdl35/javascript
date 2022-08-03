package configure;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginok() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	//MVC : 컨트롤 파트
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		/* 패스워드는 암호화가 되어 있기 떄문에 base64로 변환 후 값 전달 */
		join_module jm = new join_module();
		String passwd = jm.pass_sc(userpw);
		try {
			loginok_module lm = new loginok_module();
			loginok_module lm2 = lm.getter(userid, passwd);
			//System.out.println(lm2.u);
			//System.out.println(lm2.n);
			//System.out.println(lm2.msg);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter pr = response.getWriter();
			if(lm2.msg.intern()=="nojoin") {	//로그인 실패
				pr.write("<script>alert('아이디 및 패스워드를 다시 한번 확인하세요.'); history.go(-1);</script>");
			}
			else {	//로그인 등록
				//세션등록 session : 브라우저에 임의값을 등록하여 
				//컴퓨터가 종료될 때까지 클라이언트 메모리에 등록 시키는 작업
				HttpSession session = request.getSession();
				session.setAttribute("pid", lm2.u);
				session.setAttribute("pnm", lm2.n);
				/*setAttribute 가상의 이름 및 실제 값을 넣어서 대입*/
				pr.write("<script>alert('로그인 성공'); location.href='loginok.jsp';</script>");
				//sendRedirect : 작업완료 후 자동으로 페이지를 이동할 때 사용함
				//response.sendRedirect("./loginok.jsp");
			}
		} catch (Exception e) {
			
		}
		
	}

}
