<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="board.BoardMgr"/>
<jsp:useBean id="cmgr" class="board.BCommentMgr"/>
<%
	request.setCharacterEncoding("euc-kr");

	int totalRecord = 0;//총 게시물 수
	int numPerPage = 10;//페이지 당 레코드 수 5,10,15,30
	int pagePerBlock = 15;//블럭 당 페이지 수
	int totalPage = 0;//총 페이지 수 = (올림) 총 게시물 수/페이지 당 레코드 수 
	int totalBlock = 0;//총 블럭 수 = (올림) 총 페이지 수/블럭 당 페이지수
	int nowPage = 1;//현재 페이지
	int nowBlock = 1;//현재 블럭
	
	//page에 보여질 게시물 갯수 값
	if(request.getParameter("numPerPage")!=null&&
    		!request.getParameter("numPerPage").equals("null")){
    	numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
     }
	
	int start = 0;//tblBoard에 select 시작번호
	int end = numPerPage;//10개
	
	//검색에 필요한 값
	String keyField = "", keyWord = "";
	//검색 일 때
	if(request.getParameter("keyWord")!=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	//검색 후에 다시 검색 안된 페이지 요청
	if(request.getParameter("reload")!=null&&request.getParameter("reload").equals("true")){
		keyField = ""; keyWord= "";
	}
	
	totalRecord = mgr.getTotalCount(keyField, keyWord);
	
	//nowPage를 요청한 경우, 만약 요청하지 않으면 default 값인 0이다.
    if(request.getParameter("nowPage")!=null){
    	nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    start = (nowPage*numPerPage)-numPerPage;
    
    //전체 페이지 수
    totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
    
    //전체 블럭 수
    totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
    
    //현재블럭
    nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<html>
<head>
	<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function pageing(page){
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
	}

	function block(block){
	document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm.submit();
	}
	
	function check(){
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	
	function list(){
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage){
		//alert(numPerPage);
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num){
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
</script> 
</head>
<body bgcolor="FFFFCC">
<div align="center"><br/>
<h2>JSPBoard</h2><br/>
<table>
	<tr>
		<td width="700" align="center">
		Total : <%=totalRecord%>Articles(
		<font color="red"><%=nowPage+"/"+totalPage%></font>
		)
		</td>
		<td align="right">
			<form name="npFrm" method="post">
				<select name="numPerPage" size="1" onchange="numPerFn(this.form.numPerPage.value)">
    				<option value="5">5개 보기</option>
    				<option value="10" selected>10개 보기</option>
    				<option value="15">15개 보기</option>
    				<option value="30">30개 보기</option>
   				</select>
   			</form>
   			<script>document.npFrm.numPerPage.value="<%=numPerPage%>"</script>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td align="center" colspan="2">
		<%
				Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, end);
				int listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
				if(vlist.isEmpty()){
					out.println("등록된 게시물이 없습니다.");
				}else{
		%>
			<table cellspacing="0">
			<tr align="center" bgcolor="#D0D0D0">
				<td width="100">번 호</td>
				<td width="250">제 목</td>
				<td width="100">이 름</td>
				<td width="150">날 짜</td>
				<td width="100">조회수</td>
			</tr>
		<%
					for(int i = 0; i<numPerPage; i++){
						if(i==listSize) break;
						BoardBean bean = vlist.get(i);
						int num = bean.getNum();
						String subject = bean.getSubject();
						String name = bean.getName();
						String regdate = bean.getRegdate();
						int depth = bean.getDepth();
						int count = bean.getCount();
						String filename = bean.getFilename();		
						int bcount=cmgr.getBCommentCount(num);
		%>
			<tr align="center">
				<td><%=totalRecord-((nowPage-1)*numPerPage)-i %></td>
				<td align="left">
					<%
							if(depth>0){
								for(int j=0; j<depth; j++){
									out.println("&nbsp;");
								}
							}
					%>
				<a href="javascript:read('<%=num%>')"><%=subject%></a>
				<%if(filename!=null&&!filename.equals("")){%>
					<img src="img/icon_file.gif" align="middle">
				<%}%>
				<%if(bcount>0){ %>
				<font color="red">(<%=bcount%>)</font>
				<%}%>
				</td>
				<td><%=name%></td>
				<td><%=regdate%></td>
				<td><%=count%></td>
			</tr>
		<%}//--for%>
			</table>
		<%}//---if%>
		</td>
	</tr>
	<tr>
		<td colspan="2"><br/><br/></td>
	</tr>
	<tr>
		<td>
			<%
				//페이지에 표시될 시작 변수 및 마지막 변수
				int pageStart = (nowBlock-1)*pagePerBlock+1;
				int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
			%>
			<%if(totalPage!=0){ %>
			<!-- 이전 블럭 -->
			<%if(nowBlock>1){%>
				<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
			<%}%>&nbsp;			
			<!-- 페이징 -->
			<%for(;pageStart<pageEnd;pageStart++){	%>
			<a href="javascript:pageing('<%=pageStart%>')">
			<%if(nowPage==pageStart){%><font color="red"><%}%>
			[<%=pageStart%>]</a>
			<%if(nowPage==pageStart){%></font><%}%>
			<%}//---for%>&nbsp;
			<!-- 다음 블럭 -->
			<%if(totalBlock>nowBlock){%>
				<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
			<%}%>			
			<%}//---if%>
		</td>
		<td align="right">
			<a href="post.jsp">글쓰기</a>
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</tr>
</table>

<hr width="750"/>

<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true"> 
	<input type="hidden" name="nowPage" value="1"> 
</form>

<form  name="searchFrm"  method="post" action="list.jsp">
	<table border="0" width="527" align=center cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> 이 름</option>
    				<option value="subject"> 제 목</option>
    				<option value="content"> 내 용</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="찾기" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
</form>	
<form name="readFrm">
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
</form>
</div>
</body>
</html>