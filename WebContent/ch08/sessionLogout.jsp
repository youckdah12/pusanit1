<!-- sessionLogout.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//���� ����
		String sessionId=session.getId();
		session.invalidate();

%>
<script>
		alert("<%=sessionId+": �α׾ƿ�"%>");
		location.href="sessionLogin,jsp";
</script>