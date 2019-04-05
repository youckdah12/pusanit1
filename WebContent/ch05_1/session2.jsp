<!-- session2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String season=request.getParameter("season");
		String fruit=request.getParameter("fruit");
		String id=(String)session.getAttribute("idKey");
		String sessionId=session.getId();
		int intervalTime=session.getMaxInactiveInterval();
		if(id!=null){
%>
		<%=id%>님이 좋아하는 계절과 과일은 <%=season+"/"+fruit %><br/>
		세션ID:<%=sessionId %><br/>
		세션 유지 시간<%=intervalTime %>초<br/> 
<%			
		}else{
			out.println("세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수가 없습니다.");
		}
%>
