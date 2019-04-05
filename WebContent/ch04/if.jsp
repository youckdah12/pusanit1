<!-- if.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%//request:요청 내장객체
		
		//요청되는 값의 문자 set을 한글로 설정
		request.setCharacterEncoding("EUC-KR");
	
		String name=request.getParameter("name");
		String color=request.getParameter("color");
		
		String str="";
		if(color.equals("blue")){
			str="파란색";
		}else if(color.equals("red")){
			str="빨간색";
		}else if(color.equals("orange")){
			str="오렌지색";
		}else{
			color="white";
			str="기타색";
		
		}
%>
<body bgcolor="<%=color %>">
<h2><%=name%>님이 좋아하는 색깔은<%=str%>
입니다.</h2>
</body>

