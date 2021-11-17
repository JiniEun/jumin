<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
<script type="text/javascript">
	function updateM() {
		var url = "../admin/notice/update";
		url += "?nID=${dto.NID}";
		location.href = url;
	}
	function deleteM() {
		var url = "../admin/notice/delete";
		url += "?nID=${dto.NID}";
		location.href = url;
	}

	function listM() {
		var url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container-lg">
		<!-- <h3>공지사항 제목1</h3> -->
		<div class="card border-light mb-3">
			<div class="card-header bg-transparent" style="font-size: 20px;">${dto.title }</div>
			<input type="hidden" id="nID" name="nID" value="${dto.NID }">
			<div class="card-body">
				<h5 class="card-title">작성자</h5>
				<p class="card-text">${dto.ID }</p>
			</div>
			<div class="card-body" style="min-height: 300px;">
				<h5 class="card-title">내용</h5>
				<p class="card-text">${dto.content }</p>
			</div>
			<div class="card-footer bg-transparent">
				<p class="card-text">
					등록일 <small class="text-muted">${dto.rdate}</small>
				<p class="card-text">
					조회수 <small class="text-muted">${dto.viewcnt}</small>
			</div>
		</div>
		<br>
		<div>
			<c:if test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
				<button type="button" class="btn btn-color"
					onclick="location.href='../admin/notice/create'">등록</button>
				<button type="button" class="btn btn-color" onclick="updateM()">수정</button>
				<button type="button" class="btn btn-color" onclick="deleteM()">삭제</button>
			</c:if>
			<button type="button" class="btn btn-color" onclick="listM()">목록</button>
		</div>
	</div>
</body>
</html>