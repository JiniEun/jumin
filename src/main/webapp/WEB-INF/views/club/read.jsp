<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html>
<html>
<head>
<title>조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/static/css/tour_read.css"> <!-- 일단 tour_read.css 댓글 참조 -->
<meta charset="utf-8">
<script type="text/javascript">
	function updateM() {
		var url = "/club/update";
		url += "?clID=${dto.clID}";
		location.href = url;
	}
	function deleteM() {
		var url = "/club/delete";
		url += "?clID=${dto.clID}";
		location.href = url;
	}

	function listM() {
		var url = "/club/list";
		location.href = url;
	}
</script>
  <style>
  .btn-color {
	background-color: #5BA6A6;
	color: white;
}
  </style>
</head>
<body>
	<div class="container-lg">
		<div class="card border-light mb-3">
			<div class="card-header bg-transparent" style="font-size: 20px;">${dto.title }</div>
			<input type="hidden" id="clID" name="clID" value="${dto.clID }">
			<input type="hidden" id="ID" name="ID" value="${dto.ID}">
			<div class="card-body" style="min-height: 300px;">
				<h5 class="card-title">내용</h5>
				<p class="card-text">${dto.content }</p>
			</div>
			<div class="card-footer bg-transparent">
				<p class="card-text">
					작성자 <small class="text-muted">${dto.nickname}</small>
				<p class="card-text">
					등록일 <small class="text-muted">${dto.rdate}</small>
				<p class="card-text">
					조회수 <small class="text-muted">${dto.viewcnt}</small>
			</div>
		</div>
		<div>
				<button type="button" class="btn btn-color" onclick="updateM()">수정</button>
				<button type="button" class="btn btn-color" onclick="deleteM()">삭제</button>
			    <button type="button" class="btn btn-color" onclick="listM()">목록</button>
		</div>
		<!-- reply -->
             <br>
	<form name="replyForm">
	    <section class="reply">
	    	<input type="hidden" name="clID" value="${dto.clID}"/>
	    	<input type="hidden" name="nickname" value="${dto.nickname}"/>
	        <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
	        <button class="rebtn" id="rebtn" name="rebtn">댓글 등록</button>
	    </section>
	
	    <section class="reshow">
	        <div class="replyList"></div>
	    </section>
	
	    <section class="repaging">
	        <span>${paging}</span>
	    </section>
	</form>
	</div>
    <%@ include file="/WEB-INF/views/club/reply.jsp" %>
</body>
</html>