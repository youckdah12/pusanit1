<!-- sessionLoginProc.jsp -->
<%@page import="org.apache.catalina.Session"%>
<jsp:useBean id="mgr" class="ch08.RegisterMgr"/>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//id,pwd�� ��û�޾Ƽ�loginRegister �޼ҵ带 ȣ���Ͽ�
		//�����ϸ� sessionLoginOK.jsp������
		//�����ϸ� sessionLoing.jsp ���ư���.
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		boolean result =mgr.loginRegister1(id, pwd); //DB���� �߷翡..
		String msg="�α��� �����ʾҽ��ϴ�.";
		String location="sessionLogin.jsp";
		if(result){
			msg="�α��� �Ǿ����ϴ�.";
			location ="sessionLoginOK.jsp";
			session.setAttribute("idKey", id);
		}
		
%>

	<script> 
			alert("<%=msg%>");
			location.href="<%=location%>";
	</script> 

