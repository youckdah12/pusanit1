<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class = "member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		boolean result=mgr.insertMember(bean);
		String msg="회원가입에 실패 하였습니다.";
		String location="member.jsp";
		if(result){
			msg = "회원가입 하였습니다.";
			location = "login.jsp?id="+bean.getId();
		}
%>

<script>
		alert("<%=msg%>");
		location.href="<%=location%>";
</script>