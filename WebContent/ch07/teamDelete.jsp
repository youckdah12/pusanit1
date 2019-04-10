<!-- teamDelete.jsp:화면에 보여지는 페이지는 아니고 처리만 -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
			request.setCharacterEncoding("EUC-KR");
			int num =0;
			//정상적으로 num값을 요청 했을때 if문 실행
			if(request.getParameter("num")!=null){
				num=Integer.parseInt(request.getParameter("num"));
					mgr.deleteTeam(num);
			}
			//num값을 요청하든 안하든 teamList.jsp로 페이지 응답
				response.sendRedirect("teamList.jsp");	
%>