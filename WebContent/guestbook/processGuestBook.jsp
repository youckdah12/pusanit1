<!-- processGuestBook -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		//���� �����ϴ� ip��
		bean.setIp(request.getRemoteAddr());

		if(bean.getSecret()==null){
			bean.setSecret("0");
		}
		mgr.insertGuestBook(bean);
		response.sendRedirect("showGuestBook.jsp");
	%>