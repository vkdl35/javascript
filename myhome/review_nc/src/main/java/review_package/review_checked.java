package review_package;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(	//파일 업로드 기능 처리시 사용되는 어노테이션 속성
		fileSizeThreshold = 1024 * 1024 * 1,	//1MB(파일 업로드시 사용되는 메모리 임시크기 용량)
		maxFileSize = 1024 * 1024 * 2,			//2MB(업로드 파일 최대 크기)
		maxRequestSize = 1024 * 1024 * 2		//2MB(전송에 따른 최대 크기값)
	)
public class review_checked extends HttpServlet {
	String username, proname, star, proreview;
	private static final long serialVersionUID = 1L;
       
    public review_checked() {

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		this.username = request.getParameter("user_name");
		this.proname = request.getParameter("product_name");
		this.star = request.getParameter("star");
		this.proreview = request.getParameter("review_box");
		
		review_checked_module jm = new review_checked_module();
		ArrayList<String> list = new ArrayList<String>();
		
		Part fp = request.getPart("fileup");	//사용자 pc 이미지 경로 저장
		String fpnm = fp.getSubmittedFileName();	//업로드할 파일명 불러오기
		
		
		list.add(username);
		list.add(proname);
		list.add(star);
		list.add(proreview);
		
		if(fpnm!="") {
			String path2 = request.getServletContext().getRealPath("");	//경로 체크
			String save = path2 + "upload/";	//저장할 공간	
			String url = save + fpnm;
			String url2 = url.replace("/vkdl35/tomcat/webapps", ".");
			
			list.add(url2);	
		}
		else {
			list.add(null);
		}
		
		jm.insert(list);
		
		String r = jm.ck_msg().intern();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pr = response.getWriter();
		if(r=="ok") {
			pr.print("<script>alert('게시판에 글이 등록되었습니다.'); location.href='./index.do';</script>");
		}
		else {
			pr.print("<script>alert('데이터가 올바르지 않습니다.'); location.href='./review_write.html';</script>");
		}
	}

}
