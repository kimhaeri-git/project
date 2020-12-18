<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<style>
	.nnt{
		padding-top:320px;
		text-align:center;
		width:100%;
		height:100%;
	}
	.ct{
		align:center;
	}
	.tx{
		height:200px;
		width:500px;
	}
	.sb{
		width:500px;
	}
	.cr{
		background-color:#99BCDC;
	}
</style>

<script>
function bbs_send(){
	if(bbs_write.subject.value == ""){
		alert("제목을 입력하세요.");
		bbs_write.subject.focus();
		return;
	}
	if(bbs_write.comment.value == ""){
		alert("내용을 입력하세요.");
		bbs_write.comment.focus();
		return;
	}
	bbs_write.submit();
}
</script>
<%
String code = request.getParameter("code");
%>

<table class="nnt" border=0>
	<form name="bbs_write" action="write_insert.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="code" value="<%=code2%>">
	<tr>
		<td class="cr">옵션</td>
		<td>
		 <%if(session_level != null && session_level.equals("10")){//관리자 %>
			<input type="radio" name="gongji" value="1">공지 
			  <%} %>
			<input type="radio" name="gongji" value="2" checked>일반 
			<input type="radio" name="gongji" value="3">비밀 
		</td>
	</tr>
	<tr>
		<td class="cr">제목</td>
		<td><input id="subject" name="subject"class="sb"></td>
	</tr>
	<tr>
		<td class="cr">내용</td>
		<td><textarea id="comment" name="comment"class="tx"></textarea></td>
	</tr>
	<tr>
		<td class="cr">첨부파일</td>
		<td><input type="file" name="file1"></td>
	</tr>
	</form>
	<tr>
		<td></td>
		<td ><button onclick="bbs_send()">글쓰기</button></td>
	</tr>
</table>
<%@ include file="/include/footer.jsp" %>