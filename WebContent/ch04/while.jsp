<!-- while.jsp -->

<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%!
		public String randomColor(){
			Random r = new Random();
			String rgb = Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		return "#"+rgb;
		}
%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//msg와 number는 form에 name값을 반드시 일치(대소문자 구분)
		String msg=request.getParameter("msg");
		//통신으로 넘어오는 값은 type은 전부 문자열
		int number=Integer.parseInt(request.getParameter("number"));
	
		int cnt=0;
		while(number>cnt){
			cnt++;
%>
		<h3><font color="<%=randomColor()%>">
		<%=msg%></font></h3>
<%			
		}
%>
