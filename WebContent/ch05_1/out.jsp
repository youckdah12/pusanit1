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
��� Buffer�� ũ��<%out.print(totalBuffer); %>byte<p/>
���� Buffer�� ũ��<%out.print(remainBuffer); %>byte<p/>
��� Buffer�� ũ��<%out.print(useBuffer); %>byte<p/>
