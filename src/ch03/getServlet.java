package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ch03/getServlet")
public class getServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset=EUC-KR");
			//한글처리:server.xml에서 67라인 URIEncoding="EUC-KR"
			String msg =request.getParameter("msg");
			PrintWriter out=response.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>Get Servlet방식</h1>");
			out.println("<h2>msg:"+msg+"</h2>");
			out.println("</body>");
			out.println("</html>");
			
	}

}
