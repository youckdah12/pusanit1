<!--script.jsp-->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%! //선언문 영역
		String declaration="선언문";	
		
		public String decMethod(){
			return declaration;
		}
%>
<% //스크립트릿

	String scriptlet = "스크립트릿";
	String comment="주석";
	
	//내장객체 
	out.println("내장객체를 이용한 출력: "+declaration+"<p/>");
%>

선언문의 출력1:<%=declaration%><p/>
선언문의 출력2:<%=decMethod()%><p/>
스크립트릿의 출력:<%=scriptlet%><p/>
