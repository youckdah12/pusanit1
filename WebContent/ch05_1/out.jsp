<!-- out.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" 
					buffer="5kb"
					%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer=out.getBufferSize();
		int remainBuffer=out.getRemaining();
		int useBuffer=totalBuffer-remainBuffer;
%>
출력 Buffer의 크기<%out.print(totalBuffer); %>byte<p/>
남은 Buffer의 크기<%out.print(remainBuffer); %>byte<p/>
사용 Buffer의 크기<%out.print(useBuffer); %>byte<p/>
