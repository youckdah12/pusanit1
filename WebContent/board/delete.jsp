<%@page import="java.net.URL"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardMgr"%>
<html>
<head>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String nowPage = request.getParameter("nowPage");
		if(request.getParameter("pass")!=null){
			BoardBean bean=(BoardBean)session.getAttribute("bean");
			//���� ��û ���̽�
			String inPass =request.getParameter("pass");
			String dbPass=bean.getPass();
			//�ڹ� �⺻�� type(8����)�� �񱳴� ==�̰� 
			//������(Ŭ���� Ÿ��)�� ==�� ��ü�� �ּҰ���
			//String�� ���� �񱳴� �ݵ�� equals �ؾ��Ѵ�.
			if(inPass.equals(dbPass)){
				/*BoardMgr mgr=new BoardMgr();
				mgr.deleteBoard(num);*/
				new BoardMgr().deleteBoard(num);
				String url="list.jsp?nowPage"+nowPage;
				response.sendRedirect(url);
			}else{
				%>
					<script type="text/javascript">
						alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
						history.back();
					</script>
				<%
			}
		}else{
%>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
	<table width="50%" cellspacing="0" cellpadding="3">
		<tr>
			<td bgcolor=#dddddd height="21" align="center">
				������� ��й�ȣ�� �Է����ּ���.
			</td>
		</tr>
	</table>
	<form name="delFrm" method="post">
		<table width="70%" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center">
					<table width=80%>
						<tr>
							<td align="center">
								<input type="password" name="pass" size="17" maxlength="15">
							</td>
						</tr>
						<tr>
							<td><hr size="1" color="#eeeeee"/></td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="�����Ϸ�" onClick="check()"> 
								<input type="reset" value="�ٽþ���">
								<input type="button" value="�ڷ�" onClick="history.go(-1)">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
</body>
</html>