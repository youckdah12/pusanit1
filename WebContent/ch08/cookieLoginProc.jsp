<!-- cookieLoginProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//id,pwd
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		boolean result =true; //DB���� �߷翡..
		if(result){
			Cookie cookie=new Cookie("idKey",id);
			response.addCookie(cookie);
%>
		<script>
			alert("�α��� �Ǿ����ϴ�.");
			location.href="cookieLoginOK.jsp";
		</script>
<%}else{%>
		<script>
			alert("�α��� ���� �ʾҽ��ϴ�.");
			location.href="cookieLoginOK.jsp";
		</script>
<%}%>