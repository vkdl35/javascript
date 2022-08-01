package test;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class today extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public today() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//LocalDate ld = LocalDate.now();	//년,월,일
		//DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy년MM월dd일");
		//String today = ld.format(df);
		
		//LocalTime ld = LocalTime.now();	//시,분,초
		//DateTimeFormatter df = DateTimeFormatter.ofPattern("HH시mm분ss초");
		
		LocalDateTime ld = LocalDateTime.now();	//년,월,일,시,분,초
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH시mm분ss초");
		
		String today = ld.format(df);
		System.out.println(today);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public static void abc() {
		
	}

}
