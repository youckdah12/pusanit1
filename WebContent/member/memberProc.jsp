<!-- memberProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class = "member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		boolean result=mgr.insertMember(bean);
		String msg="ȸ�����Կ� ���� �Ͽ����ϴ�.";
		String location="member.jsp";
		if(result){
			msg = "ȸ������ �Ͽ����ϴ�.";
			location = "login.jsp?id="+bean.getId();
		}
%>

<script>
		alert("<%=msg%>");
		location.href="<%=location%>";
</script>