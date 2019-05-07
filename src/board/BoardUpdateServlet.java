package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		
		//���ǿ������� ��� ��������
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass =bean.getPass();
		String inPass =request.getParameter("pass");
		if(inPass.equals(dbPass)) {
			//update.jsp ��û�� ���� ���̺� �����Ѵ�.
			BoardBean upBean=new BoardBean();
			upBean.setNum(Integer.parseInt(request.getParameter("num")));
			upBean.setName(request.getParameter("name"));
			upBean.setSubject(request.getParameter("subject"));
			upBean.setContent(request.getParameter("content"));
			new BoardMgr().updateBoard(upBean);
			String nowPage =request.getParameter("nowPage");
			String url="read.jsp?nowPage="+nowPage+"&num="+upBean.getNum();
			response.sendRedirect(url);
		}else{
			out.println("<script>");
			out.println("alert('�Է��ѽ� ��� ��ȣ�� �ƴմϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
