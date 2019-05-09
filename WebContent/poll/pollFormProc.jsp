<!-- pollFormProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num =Integer.parseInt(request.getParameter("num"));
		String item[] =request.getParameterValues("itemnum");
		boolean result = mgr.updatePoll(num,item);
		String msg ="투표가 등록되지 않았습니다.";
		if(result){
			msg ="투표 하였습니다.";
		}
%>
<script>
		alert("<%=msg%>");
		location.href="pollList.jsp?num=<%=num%>";
</script>