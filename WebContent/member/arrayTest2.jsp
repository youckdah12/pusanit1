<!-- arrayTest2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//arrayTest2.jsp?hobby=인터넷&hobby=여행
		String hobby[]=request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++){
			out.print(hobby[i]+"&nbsp;");
		}
%>