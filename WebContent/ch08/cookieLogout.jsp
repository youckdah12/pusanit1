<!-- cookieLogout.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("idKey")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
%>
		<script>
			alert("로그아웃 되었습니다.");
			location.href="cookieLogin.jsp";
		</script>
