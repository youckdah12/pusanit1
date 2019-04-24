<!-- showGuestBook.jsp -->
<%@page import="guestbook.JoinBean"%>
<%@page import="guestbook.GuestBookBean"%>
<%@page import="guestbook.GuestBookMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<%@include file="getSession.jsp"%>
<title>GuestBook</title>
<script type="text/javascript">
	function updateFn(num){
		url="updateGuestBook.jsp?num="+num;
		window.open(url,"Update GuestBook","width=520,hight=300");
	}

</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@include file="postGuestBook.jsp"%>
<% 
		GuestBookMgr mgr=new GuestBookMgr();
		Vector<GuestBookBean> vlist=mgr.listGuestBook(login.getId(), login.getGrade());
%>

<table width="520" cellspacing="0" cellpadding="3">
	<tr bgcolor="#F5F5F5">
		<td>
		<font size="2">
		<b><%=login.getName() %></b>님 환영합니다.
		</font>
		</td>
		<td align="right">
			<a href="logout.jsp">로그아웃</a>	
			</td>
	</tr>
</table>
<!-- GuestBook List Start-->
<% 
		if(vlist.isEmpty()){
	%>	
	<table width="520" cellspacing="0" cellpadding="7">
		<tr>
				<td>등록된 글이 없습니다.</td>
		</tr>
	</table>	
	<%}else{
		for(int i=0;i<vlist.size();i++){
			GuestBookBean bean=vlist.get(i);
			//방명록 쓴 사람정보
			JoinBean writer=mgr.getJoin(bean.getId());
%>
		<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table bgcolor="#F5F5F5">
							<tr>
									<td width="225">NO:<%=vlist.size()-i%></td>
									<td width="225">
									<img src="img/face.bmp" border="0" alt="이름">
									<a href="mailto:<%=writer.getEmail() %>">
									<%=writer.getName()%></a>
									</td>
									<td width="150" align="center">
									<%if(writer.getHp()==null||writer.getHp().equals("")){
										out.print("홈페이지가 없네요.");
									}else{
										%>
										<a href="http://<%=writer.getHp()%>">
											<img alt="홈페이지" src="img/hp.bmp" border="0">
										</a>
										<%}%>
									<%=writer.getHp()%></td>
							</tr>
							<tr>
									<td colspan="3"><%=bean.getContents()%></td>
							</tr>
							<tr>
									<td>IP: <%=bean.getIp() %></td>
									<td><%=bean.getRegdate()+" "+
									bean.getRegtime()%></td>
								
									<td>
									<%
											//로그인 id와 방명록 쓴사람 id와 동일하다면 수정 ,삭제 모드 활성화
											boolean chk=login.getId().equals(writer.getId());
											if(chk||login.getGrade().trim().equals("1")){
												if(chk){
									%>
											<a href="javascript:updateFn('<%=bean.getNum() %>')">[수정]</a>
									<%}%>
											<a href="deleteGuestBook.jsp?num=<%=bean.getNum() %>">[삭제]</a>
									<%
											if(bean.getSecret().trim().equals("1")){
												out.println("비밀글");
												}
											}
											%>
									</td>
							</tr>
						</table>
					</td>
				</tr>
		</table>

<%
			}//--for	
		}//--if
%>
<!-- GuestBook List End -->
</div>
</body>
<%}//getSession,jsp에 else를 닫는다. %>
</html>