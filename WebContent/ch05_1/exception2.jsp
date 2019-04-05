<!-- exception2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page isErrorPage="true"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String message=exception.getMessage();
		String objectMessage=exception.toString();
%>
에러 메세지:<%=message%><br/>
에러 클래스와 메세지:<%=objectMessage%><br/>