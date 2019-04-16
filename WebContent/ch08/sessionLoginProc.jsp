<!-- sessionLoginProc.jsp -->
<%@page import="org.apache.catalina.Session"%>
<jsp:useBean id="mgr" class="ch08.RegisterMgr"/>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//id,pwd를 요청받아서loginRegister 메소드를 호출하여
		//성공하면 sessionLoginOK.jsp보내고
		//실패하면 sessionLoing.jsp 돌아간다.
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		boolean result =mgr.loginRegister1(id, pwd); //DB연동 추루에..
		String msg="로그인 되지않았습니다.";
		String location="sessionLogin.jsp";
		if(result){
			msg="로그인 되었습니다.";
			location ="sessionLoginOK.jsp";
			session.setAttribute("idKey", id);
		}
		
%>

	<script> 
			alert("<%=msg%>");
			location.href="<%=location%>";
	</script> 

