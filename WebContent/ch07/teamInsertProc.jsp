<!-- teamInsertProc.jsp -->
<!-- 액션태그 없이 만듬. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//DB연동을 위한 mgr 객체를 생성
		TeamMgr mgr=new TeamMgr();
		//요청한 값들을 저장하기 위해 빈즈르 생성
		TeamBean bean=new TeamBean();
		
		
		//요청한 값을 받음.
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		int age=Integer.parseInt(request.getParameter("age"));
		String team=request.getParameter("team");
		
		//요청한 값들을 빈즈에 저장
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		//DB에 요청한 값을 저장
		boolean result=mgr.insertTeam(bean);
		String str="가입 실패";
		String location="teamInsert.hrml";
		if(result){
			str="가입 성공";
			location="teamList.jsp";
		}
%>
<script>
	alert("<%=str%>");
	location.href="<%=location%>";
</script>