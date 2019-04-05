<!-- for.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
1에서 10까지의 합은(식 포함)?<p/>
1.표현식으로 출력<br/>
<% 
			int sum=0;
			for(int i=1;i<=10;i++){
			if(i<10){
%>
			<%=i+"+" %>
<%
			}else{
%>
			<%=i+"="%>
<%
			}//--if
			sum+=i;
			}//--for
%>
<%=sum%><p/>
2.out.println을 사용하여 출력<br/>
<%
		sum=0;
		for(int i=1;i<=10;i++){
			if(i<10){
				out.println(i+"+");
			}else{
				out.println(i+"=");
			}
			sum+=i;
		}//--for
		out.println(sum);
%>