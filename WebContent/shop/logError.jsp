<%@ page contentType="text/html;charset=EUC-KR"%>
<%
	String mode = request.getParameter("mode");
	String msg = "";
	if (mode.equals("0")) {
		msg = "���̵� �� ��й�ȣ�� �ٽ� Ȯ���Ͻñ� �ٶ��ϴ�.";
	} else if (mode.equals("1")) {
		msg = "���̵�� ������ ��й�ȣ�� �ٽ� Ȯ���Ͻñ� �ٶ��ϴ�.";
	}
%>
<html>
<head>
<title>�α��� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<br />
	<br />
	<br />
	<div align="center">
		<b>�α��ο� �����ϼ̽��ϴ�.<br /> <br /><%=msg%><br /> <br /></b> <input
			type="button" value="�ٽþ���" onClick="history.back()">
	</div>
</body>
</html>