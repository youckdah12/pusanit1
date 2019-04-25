<!-- showGuestBook.jsp -->
<%@page import="guestbook.CommentBean"%>
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
	function commentPost(frm){
		if(frm.comment.value==""){
			alert("������ �Է����ּ���.");
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	//<div id="cmt">
		function disFn(num){
			var txt="cmt"+num;
			var e=document.getElementById(txt);
			if(e.style.display=='none')
				e.style.display='block';
			else
				e.style.display='none';
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
		<b><%=login.getName() %></b>�� ȯ���մϴ�.
		</font>
		</td>
		<td align="right">
			<a href="logout.jsp">�α׾ƿ�</a>	
			</td>
	</tr>
</table>
<!-- GuestBook List Start-->
<% 
		if(vlist.isEmpty()){
	%>	
	<table width="520" cellspacing="0" cellpadding="7">
		<tr>
				<td>��ϵ� ���� �����ϴ�.</td>
		</tr>
	</table>	
	<%}else{
		for(int i=0;i<vlist.size();i++){
			GuestBookBean bean=vlist.get(i);
			//����� �� �������
			JoinBean writer=mgr.getJoin(bean.getId());
%>
		<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table bgcolor="#F5F5F5">
							<tr>
									<td width="225">NO:<%=vlist.size()-i%></td>
									<td width="225">
									<img src="img/face.bmp" border="0" alt="�̸�">
									<a href="mailto:<%=writer.getEmail() %>">
									<%=writer.getName()%></a>
									</td>
									<td width="150" align="center">
									<%if(writer.getHp()==null||writer.getHp().equals("")){
										out.print("Ȩ�������� ���׿�.");
									}else{
										%>
										<a href="http://<%=writer.getHp()%>">
											<img alt="Ȩ������" src="img/hp.bmp" border="0">
										</a>
										<%}%>
									</td>
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
											//�α��� id�� ����� ����� id�� �����ϴٸ� ���� ,���� ��� Ȱ��ȭ
											boolean chk=login.getId().equals(writer.getId());
											if(chk||login.getGrade().trim().equals("1")){
												if(chk){
									%>
											<a href="javascript:updateFn('<%=bean.getNum() %>')">[����]</a>
									<%}%>
											<a href="deleteGuestBook.jsp?num=<%=bean.getNum() %>">[����]</a>
									<%
											if(bean.getSecret().trim().equals("1")){
												out.println("��б�");
												}
											}
											%>
									</td>
							</tr>
						</table>
					</td>
				</tr>
		</table>
<!-- Comment List Start -->
<div id="cmt<%=bean.getNum()%>">
<%
		Vector<CommentBean> cvlist=mgr.listComment(bean.getNum());
		if(!cvlist.isEmpty()){
%>
		<table width="500" bgcolor="#F5F5F5">
<%
		for(int j=0;j<cvlist.size();j++){
				CommentBean cbean=cvlist.get(j);
%>
		<tr>
			<td>
				<table width="500">
					<tr>
						<td><b><%=cbean.getCid() %></b></td>
						<td align="right">
						<%if(cbean.getCid().equals(login.getId())){ %>
						<a href="commentProc.jsp?flag=delete&cnum=<%=cbean.getCnum()%>">[����]</a>
						<%} %>
						</td>
					</tr>
					<tr>
					<td colspan="2"><%=cbean.getComment() %></td>
					</tr>
					<tr>
					<td><%=cbean.getCip() %></td>
					<td align="right"><%=cbean.getCregDate() %></td>
					</tr>
				</table>
				<hr/>
			</td>
		</tr>
<%}//--for %>
</table>
<%}//--if %>
</div>
<table width="500">
<tr>
<td><button onclick="disFn('<%=bean.getNum()%>')">���<%=cvlist.size() %></button></td>
</tr>
</table>
<!-- Comment List End -->
<!-- Comment Form Start -->
				<form name="cFrm" action="commentProc.jsp">
				<table>
				<tr>
					<td><textarea name="comment" cols="72" rows="2"
							maxlength="1000"></textarea></td>
					<td><input type="button" value="���" onclick="javascript:commentPost(this.form)">
					<input type="hidden" name="flag" value="insert">
					<input type="hidden" name="num" value="<%=bean.getNum()%>">
					<input type="hidden" name="cid" value="<%=login.getId()%>">
					<input type="hidden" name="cip" value="<%=request.getRemoteAddr()%>">
					</td>
				</tr>
				</table>
				</form>
<!-- Comment Form End -->
<%
			}//--for	
		}//--if
%>
<!-- GuestBook List End -->
</div>
</body>
<%}//getSession,jsp�� else�� �ݴ´�. %>
</html>