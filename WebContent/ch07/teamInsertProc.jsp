<!-- teamInsertProc.jsp -->
<!-- �׼��±� ���� ����. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//DB������ ���� mgr ��ü�� ����
		TeamMgr mgr=new TeamMgr();
		//��û�� ������ �����ϱ� ���� ��� ����
		TeamBean bean=new TeamBean();
		
		
		//��û�� ���� ����.
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		int age=Integer.parseInt(request.getParameter("age"));
		String team=request.getParameter("team");
		
		//��û�� ������ ��� ����
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		//DB�� ��û�� ���� ����
		boolean result=mgr.insertTeam(bean);
		String str="���� ����";
		String location="teamInsert.hrml";
		if(result){
			str="���� ����";
			location="teamList.jsp";
		}
%>
<script>
	alert("<%=str%>");
	location.href="<%=location%>";
</script>