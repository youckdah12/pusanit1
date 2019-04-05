<!-- response2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		response.setHeader("pragma","no-cache");
		if(request.getProtocol().equals("HTTP/1.1")){
		response.setHeader("Cache-Control", "no-store");
		}
%>
respose2.jsp로 페이지가 넘어옴 .