<!-- fdeleteProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="fileupload.FileuploadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
       //체크된 fch값을 배열로 리턴
		String snum[]=request.getParameterValues("fch");
       //문자열 snum값을 정수 num값으로 변환하기 위해 int 배열을 만듬.
       //num의 크기는 snum이랑 같다.
		int num[]=new int[snum.length];
       //문자열 배열을 정수타의 배열로 변환
		for(int i=0;i<snum.length;i++){
			num[i]=Integer.parseInt(snum[i]);
		}
       mgr.deleteFile(num);
       response.sendRedirect("flist.jsp");
%>