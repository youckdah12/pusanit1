<!-- includeTag1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		/*String name=request.getParameter("name");*/
%>
<%-- 이름:<%=name%> --%>
<!-- 요청정보request 도 같이 include 페이지로 넘어간다. -->
<jsp:include page="includeTag2.jsp"/>

