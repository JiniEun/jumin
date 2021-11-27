<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/static/css/market.css">
<title>조회</title>
<meta charset="utf-8">

<script type="text/javascript">
	function deleteC() {
		var url = "/community/delete";
		url += "?cid=${dto.cid}";
		location.href = url;
	}

	function updateC() {
		var url = "/community/update";
		url += "?cid=${dto.cid}";
		location.href = url;
	}
</script>

</head>
<body>
	<div class="container-lg">

		<h2 style="margin-bottom: 20px;">Community</h2>

		<div class="card card-default">
			<div class="card-header bg-transparent" style="font-size: 20px;">${dto.title}</div>

			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<h5 class="card-title">작성자</h5>
					<p class="card-text">${dto.nickname}</p>
				</li>
				<li class="list-group-item" style="min-height: 300px;">
					<h5 class="card-title">내용</h5>
					<p class="card-text">${dto.content }</p>
				</li>
			</ul>

			<div class="card-footer bg-transparent">
				<p class="card-text">
					등록일 <small class="text-muted">${dto.rdate}</small>
				<p class="card-text">
					조회수 <small class="text-muted">${dto.viewcnt}</small>
			</div>
		</div>
		<br>

		<!-- reply -->
		<form name="replyForm">
			<section class="reply">
				<input type="hidden" name="cid" value="${dto.cid}" /> <input
					type="hidden" name="nickname" value="${dto.nickname}" /> <input
					type="text" class="form-control" id="content" name="content"
					placeholder="내용을 입력하세요.">
				<button class="rebtn" id="rebtn" name="rebtn">댓글 등록</button>
			</section>

			<section class="reshow">
				<div class="replyList"></div>
			</section>

			<section class="repaging">
				<span>${paging}</span>
			</section>
		</form>

		<%@ include file="reply.jsp"%>
		<br>

		<div>

			<button type="button" class="btn btn-color" onclick="updateC()">수정</button>
			<button type="button" class="btn btn-color" onclick="deleteC()">삭제</button>
			<button type="button" class="btn btn-color"
				onclick="location.href='${root}/community/list'">목록</button>
		</div>
	</div>
</body>
</html>