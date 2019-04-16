<!-- postJsp.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<body>
<h1>Post Servlet방식</h1>
<form method="post" action="postServlet">
id:<input name="id"><br/>
pwd:<input type="password" name="pwd"><br/>
email: <input name="email"><br/>
<input type="submit" value="전송">
</form>
</body>
</html>
