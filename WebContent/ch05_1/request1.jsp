<!-- request1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String name=request.getParameter("name");
		String studentNum=request.getParameter("studentNum");
		String gender=request.getParameter("gender");
		String major=request.getParameter("major");
		String hobby[]=request.getParameterValues("hobby");
		
		if(gender.equals("man")){
			gender="남자";
		}else{
			gender="여자";
		}
%>
성명:<%=name%><br/>
학번:<%=studentNum%><br/>
성별:<%=gender%><br/>
학과:<%=major%><br/>
취미:<%
		for(int i=0;i<hobby.length;i++){
				out.println(hobby[i]+"&nbsp;");
		}
%>
				