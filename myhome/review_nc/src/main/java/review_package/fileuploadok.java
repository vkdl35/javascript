package review_package;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;

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

public class fileuploadok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public fileuploadok() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		/*	//[Stream없이 사용하는 방식]
		//getServletContext() : 절대경로를 체크 (Servlet에 대한 환경설정 형태)
		//getRealPath("") : 어플리케이션 실제 경로 (서버 물리 경로)
		Part filepart = request.getPart("file");	//사용자 PC에 있는 이미지 경로를 저장
		String filename = filepart.getSubmittedFileName();	//업로드할 파일명을 가져옴
		String paths = request.getServletContext().getRealPath("");
		//Servlet : Server + let
		//System.out.println(paths);
		String savepath = paths + "upload/";	//저장할 공간

		for(Part part:request.getParts()) {		//여러개의 파일을 업로드시 모든 파일을 서버에 저장되도록 하기 위함
			//해당 파일을 저장할 위치에 동일한 이름으로 카피하게 됩니다.
			part.write(savepath + filename);
		}
		*/
		
		/*	[Stream 있는 형태의 파일 업로드]
		Part filepart = request.getPart("file");	//사용자 PC에 있는 이미지 경로를 저장
		String filename = filepart.getSubmittedFileName();	//업로드할 파일명을 가져옴
		String paths = request.getServletContext().getRealPath("");
		InputStream is = filepart.getInputStream();	//getInputStream() - Servlet
		String savepath = paths + "upload/" + filename;	//저장할 공간
		FileOutputStream fo = new FileOutputStream(savepath);
		
		byte[] bf = new byte[1024];
		int size = 0;
		while((size=is.read(bf))!=-1) {
			fo.write(bf,0,size);
		}
		fo.close();
		is.close();
		*/
		
		/*[mutiple 사용시] - JCF (Java Collection Framework)*/
		
		//Collection : 배열 형태 (Servlet에서 최상의 배열 선언문)
		
		/*배열(Array), 컬렉션(Collection 데이터배열), 맵(Map)*/
		Collection<Part> filepart = request.getParts();
		//일반배열 생성 - 파일명 및 파일 속성을 가져오기 위해서
		ArrayList<Part> result = new ArrayList<Part>(filepart.size());
		for(Part part : filepart) {
			result.add(part);	//일반 배열값에 저장
		}
		String filenm = null;
		String paths = request.getServletContext().getRealPath("");
		String savepath = paths + "upload/";
		
		int w = 0;
		while(w < result.size()) {
			filenm = result.get(w).getSubmittedFileName();
			result.get(w).write(savepath + filenm);
			response.getWriter().print(savepath + filenm + "<br>");
			w++;
		}
		
		
	}

}
