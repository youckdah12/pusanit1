<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<!-- TeamMgr mgr=new teamMgr() -->
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<!-- TeamBean bean=new TeamBean() -->
<jsp:useBean id="bean" class="ch07.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result=mgr.insertTeam(bean);
		String str="가입실패";
		String location="teamInsert.htlm";
		if(result){
			str="가입성공";
			location="teamList.jsp";
		}
%>
<script>
	alert("<%=str%>");
	<%--  location.href("<%=location%>"); --%>
 	location.href="<%=location%>";
</script>
