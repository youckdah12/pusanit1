<!-- pollFormProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num =Integer.parseInt(request.getParameter("num"));
		String item[] =request.getParameterValues("itemnum");
		boolean result = mgr.updatePoll(num,item);
		String msg ="��ǥ�� ��ϵ��� �ʾҽ��ϴ�.";
		if(result){
			msg ="��ǥ �Ͽ����ϴ�.";
		}
%>
<script>
		alert("<%=msg%>");
		location.href="pollList.jsp?num=<%=num%>";
</script>