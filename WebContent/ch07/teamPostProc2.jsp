<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<!-- TeamMgr mgr=new teamMgr() -->
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<!-- TeamBean bean=new TeamBean() -->
<jsp:useBean id="bean" class="ch07.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result=mgr.insertTeam(bean);
		String str="���Խ���";
		String location="teamInsert.htlm";
		if(result){
			str="���Լ���";
			location="teamList.jsp";
		}
%>
<script>
	alert("<%=str%>");
	<%--  location.href("<%=location%>"); --%>
 	location.href="<%=location%>";
</script>
