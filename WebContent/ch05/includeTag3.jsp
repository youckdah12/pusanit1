<!-- includeTag3.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");		
%>
<!-- includeTag2.html에 입력한 siteName 정보값은 같이 요청-->
<jsp:include page="includeTag4.jsp">
	<jsp:param value="홍길동" name="name"/>
</jsp:include>