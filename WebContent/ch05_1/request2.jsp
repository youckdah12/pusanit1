<!-- request2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		String protocol=request.getProtocol();
		String serverName=request.getServerName();
		int serverPort=request.getServerPort();
		String remoteAddr=request.getRemoteAddr();
		String remoteHost=request.getRemoteHost();
		String method=request.getMethod();
		StringBuffer requestURL=request.getRequestURL();
		String requestURI=request.getRequestURI();
		String useBrowser=request.getHeader("User-Agent");
		String query=request.getQueryString();
	
%>

�������� : <%=protocol%><p/>
������ �̸� : <%=serverName%><p/>
������ ��Ʈ ��ȣ :<%=serverPort%><p/>
����� ��ǻ���� �ּ� : <%=remoteAddr%><p/>
����� ��ǻ���� �̸� : <%=remoteHost%><p/>
��� method : <%=method%><p/>
��û ���(URL) : <%=requestURL%><p/>
��û ���(URI) : <%=requestURI%><p/>
���� ����ϴ� ������ : <%=useBrowser%><p/>
Query:<%=query%><p/>