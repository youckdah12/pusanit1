<!-- simpleBean2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!-- simpleBean 객체를 생성  -->
<jsp:useBean id="bean" class="ch07.SimpleBean"/>
<!-- 요청된 message를 받고 message에 저장 -->
<jsp:setProperty property="message" name="bean"/>
<!-- 빈즈에서 message를 가져온다.-->
message2:
<jsp:getProperty property="message" name="bean"/> 

