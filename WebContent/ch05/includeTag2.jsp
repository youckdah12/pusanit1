<!-- includeTag2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String name=request.getParameter("name");
%>
include Action Tag의 입니다.<p/>
<%=name%>
<hr color="red" width="100"  align="left"/>
