package FAQ_pack;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQ_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FAQ_list() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			select_SQL ss = new select_SQL();
			ArrayList<select_SQL> faqdata = ss.viewdata();
			req.setAttribute("list", faqdata);

			
			
			RequestDispatcher rd= req.getRequestDispatcher("./FAQ_list.jsp");
			rd.forward(req,resp);
		} catch ( Exception e) {
			
		System.out.println(e);
		}
		
	}

}
