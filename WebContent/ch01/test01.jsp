<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		Date d=new Date(); 
%>
<html>

<body>
<%=d.toLocaleString() %>
</body>
</html>