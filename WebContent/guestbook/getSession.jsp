<!-- getSession.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		String id=(String)session.getAttribute("idKey");
		if(id==null){
			StringBuffer url=request.getRequestURL();
			response.sendRedirect("login.jsp?url="+url);
		}else{//�ݴ� �߰�ȣ�� �� �������� include�ϴ� �������� ����
	
		
%>