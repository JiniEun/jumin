<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/resources/static/css/market.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<meta charset="UTF-8">
<title>상세페이지</title>
<script type="text/javascript">
	function updateM() {
		var url = "/market/update";
		url += "?mid=${dto.mid}";
		location.href = url;
	}

	function deleteM() {
		var url = "/market/delete";
		url += "?mid=${dto.mid}";
		location.href = url;
	}
</script>

<title>동네장터 조회</title>
</head>
<body>
	<div class="container mt-5 mb-4 pb-4">

		<h2 class="col-12 text-center tm-section-title"></h2>


		<div class="section">

			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03">

			<div class="slidewrap">
				<ul class="slidelist">
					<li><a> <label for="slide03" class="left"></label> <img
							src="/market/storage/${fn:split(dto.filename,',')[0]}"
							width="500px" height="500px"> <label for="slide02"
							class="right"></label>
					</a></li>
					<li><a> <label for="slide01" class="left"></label> <img
							src="/market/storage/${fn:split(dto.filename,',')[1]}"
							width="500px" height="500px"> <label for="slide03"
							class="right"></label>
					</a></li>
					<li><a> <label for="slide02" class="left"></label> <img
							src="/market/storage/${fn:split(dto.filename,',')[2]}"
							width="500px" height="500px"> <label for="slide01"
							class="right"></label>
					</a></li>

				</ul>

				<div class="slide-control">
					<div class="control01">
						<label for="slide03" class="left"></label> <label for="slide02"
							class="right"></label>
					</div>
					<div class="control02">
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label>
					</div>
					<div class="control03">
						<label for="slide02" class="left"></label> <label for="slide01"
							class="right"></label>
					</div>
				</div>

				<ul class="slide-pagelist">
					<li><label for="slide01"></label></li>
					<li><label for="slide02"></label></li>
					<li><label for="slide03"></label></li>
				</ul>

			</div>


		</div>


		<div class="card card-default">
			<div class="card-header" style="font-size: 18px;">${dto.title}</div>

			<div class="card-body" style="color: #808088">

				<i class="fas fa-user"></i>&nbsp<span class="card-text">${dto.nickname}</span>
				<p class="card-text">
					<small class="text-muted">${dto.rdate}</small> <br>
			</div>

			<div class="card-body">
				<p class="card-text">${dto.content}</p>
			</div>
			<div class="card-footer bg-transparent" style="color: #808088">
				<p class="card-text">
					조회수 <small class="text-muted">${dto.viewcnt}</small>
			</div>

		</div>

		<br>
		<!-- reply -->
		<form name="replyForm">
			<section class="reply">
				<input type="hidden" name="mid" value="${dto.mid}" /> <input
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
			<c:choose>
				<c:when test="${sessionScope.ID==dto.id}">

					<button type="button" class="btn btn-color" onclick="updateM()">수정</button>
					<button type="button" class="btn btn-color" onclick="deleteM()">삭제</button>
					<button type="button" class="btn btn-color"
						onclick="location.href='${root}/market/list'">목록</button>

				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-color"
						onclick="location.href='${root}/market/list'">목록</button>
				</c:otherwise>
			</c:choose>

		</div>



	</div>





</body>
</html>