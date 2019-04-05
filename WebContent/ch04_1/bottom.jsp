<!-- bottom.jsp -->
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		Date d=new Date();
%>
<hr/>
include 지시자의 bottom입니다.<p/>
<%=d.toLocaleString()%>
</body>
</html>
