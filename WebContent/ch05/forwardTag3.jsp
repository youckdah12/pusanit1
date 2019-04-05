<!-- forwardTag3.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String bloodType=request.getParameter("bloodType");
		String name="°­È£µ¿";		
%>
<jsp:include page='<%=bloodType+".jsp"%>'>
		<jsp:param value="<%=name%>" name="name"/>
</jsp:include>