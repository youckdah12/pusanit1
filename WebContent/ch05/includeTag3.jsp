<!-- includeTag3.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");		
%>
<!-- includeTag2.html�� �Է��� siteName �������� ���� ��û-->
<jsp:include page="includeTag4.jsp">
	<jsp:param value="ȫ�浿" name="name"/>
</jsp:include>