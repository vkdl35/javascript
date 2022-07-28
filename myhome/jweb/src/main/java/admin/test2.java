package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class test2 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;

    public test2() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user = request.getParameter("user_name").intern();
		this.pr = response.getWriter();
		if(user=="홍길동") {	//해당 사용자의 정보를 배열값으로 전송
			List<String> list = new ArrayList<String>();	//list 빈배열 생성
			list.add("hong");	//배열값을 저장1
			list.add("hong@nate.con");	//배열값을 저장2
			JSONObject jdata = new JSONObject();	//실제 배열형태의 구조로 {}를 생성하기 위해서 사용(java는 []밖에 없음)
			jdata.put("list", list);	//put : 기존 값에서 추가로 사용할 때 
			response.setContentType("application/x-json; charset=utf-8");	//json 배열 형태로 전송
			response.getWriter().print(jdata);
			//call로 보낼 경우 무조건 한번만 사용
		}
		else {			
			this.pr.print("error");
		}
		

		
	}

}
