<!-- simpleBean.jsp -->
<%@page import="ch07.SimpleBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String message=request.getParameter("message");
		SimpleBean bean =new SimpleBean();
		bean.setMessage(message);
%>
message:<%=bean.getMessage()%>