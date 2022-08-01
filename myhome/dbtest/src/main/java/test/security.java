package test;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class security extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public security() {

    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* base64 - decode, encode 두가지가 존재합니다. 
		 * 기초 암호화 부분이며, 역으로 암호를 풀수도 있습니다.*/
		/*
		String pw = "a12345";
		byte[] a = pw.getBytes();
		Encoder ec = Base64.getEncoder();
		byte[] ectext = ec.encode(a);
		//System.out.println(ectext.toString());
		System.out.println(new String(ectext));
		
		String pw2 = "YTEyMzQ1";
		Decoder dc = Base64.getDecoder();
		byte[] dctext = dc.decode(pw2);
		System.out.println(new String(dctext));
		*/
		//String se = Base64.Encoder(pw);
		
		//응용
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		Decoder dc = Base64.getDecoder();
		byte[] userpw = dc.decode(pw);
		System.out.println(new String(userpw));
		
		try {
			//MD5 형태 암호화
			//MessageDigest : Hash 알고리즘 (암호화)
			String p = "a1234";
			MessageDigest md5 = MessageDigest.getInstance("MD3");
			md5.update(p.getBytes("UTF-8"));	//update -> Byte로 바꿈
			byte[] md = md5.digest();	//배열 기준으로 대입하게 됨
			StringBuilder sb = new StringBuilder();	//StringBuilder : 문자 배열
			for(byte ck:md) {
				String recode = String.format("%02x", ck);
				//%02x : 16진수 변환
				sb.append(recode);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		/*String pw = "a12345";
	      String se = Base64.getEncoder().encodeToString(pw.getBytes()); 
	      System.out.println(se);*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
