<!-- exception1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page errorPage="exception2.jsp" %>
<%
		request.setCharacterEncoding("EUC-KR");
		out.print(10/0);
%>