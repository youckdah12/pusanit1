<!-- includeTag4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String name=request.getParameter("name");
		String siteName=request.getParameter("siteName");
%>
name:<%=name%><br/>
siteName:<%=siteName%><br/>
<hr color="blue"/>