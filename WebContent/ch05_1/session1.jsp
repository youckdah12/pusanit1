<!-- session1.jsp -->
<%@page import="org.apache.catalina.startup.SetAllPropertiesRule"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//DB연동 가정하고..
	boolean result = true;
	if (result) {
		//로그인 성공
		//세션객체네 로그인 정보저장
		session.setAttribute("idKey", id);
		session.setMaxInactiveInterval(60 * 3);//3분
	} else {
		//로그인 실패
%>
<script>
	alert("로그인 실패입니다.");
	location.href - "session1.html";
</script>
<%
	}
%>
		<h1>Session Example1</h1>
		<FORM METHOD=POST ACTION="session2.jsp">
			1.가장 좋아하는 계절은?<br> <INPUT TYPE="radio" NAME="season" VALUE="봄">봄
			<INPUT TYPE="radio" NAME="season" VALUE="여름">여름 <INPUT
				TYPE="radio" NAME="season" VALUE="가을">가을 <INPUT TYPE="radio"
				NAME="season" VALUE="겨울">겨울
			<p>
		
				2.가장 좋아하는 과일은?<br> <INPUT TYPE="radio" NAME="fruit"
					VALUE="watermelon">수박 <INPUT TYPE="radio" NAME="fruit"
					VALUE="melon">멜론 <INPUT TYPE="radio" NAME="fruit"
					VALUE="apple">사과 <INPUT TYPE="radio" NAME="fruit"
					VALUE="orange">오렌지
			<p>
				<INPUT TYPE="submit" VALUE="결과보기">
		</FORM>
