<!-- scriptletTest.jsp -->
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%//스크립트릿->_jspService 영역에 만들어짐.

		Calendar c= Calendar.getInstance();
		int hour=c.get(Calendar.HOUR_OF_DAY);
		int minute=c.get(Calendar.MINUTE);
		int second=c.get(Calendar.SECOND);
%>
<h1>현재시간 <%=hour %>시
<%=minute%>분<%=second%>초 입니다.
</h1>


