<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<title>동호회 페이지</title>
<link rel="stylesheet" href="/resources/static/css/market_list.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<meta charset="utf-8">
<style>
.btn-color1 {
	border-color: #5BA6A6;
	color: #5BA6A6;
}

.btn-color2 {
	background-color: #5BA6A6;
	color: white;
}
</style>

</head>

<body>
	<div id="features-wrapper">
		<div class="container">
			<div id="top">
				<h2 class="col-12 text-center tm-section-title"
					style="color: #5BA6A6;">우리 동네 동호회</h2>
				<p class="col-12 text-center">
					우리 동네 동호회를 소개하고 소식을 공유해보세요! <br> <br>
					<c:if test="${not empty sessionScope.ID}">
						<button type="button" class="btn btn-color1"
							onclick="location.href='../club/create'">글 등록하기</button>
					</c:if>
				</p>
			</div>

			<form class="form-inline" action="list">
				<div class="form-group">
					<select class="form-control" name="col" style="margin-right: 10px;">
						<option value="total"
							<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
						<option value="title"
							<c:if test= "${col=='title'}"> selected </c:if>>제목</option>
						<option value="content"
							<c:if test= "${col=='content'}"> selected </c:if>>내용</option>
						<option value="title_content"
							<c:if test= "${col=='title_content'}"> selected</c:if>>제목+내용</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요"
						name="word" style="margin-right: 10px;" value="${word}">
				</div>
				<button type="submit" class="btn btn-color2"
					style="margin-right: 10px;">검색</button>
			</form>
			<br>

			<c:choose>
				<c:when test="${empty list}">
					<div class="row">

						<div>등록된 글이 없습니다.</div>

					</div>
				</c:when>

				<c:otherwise>
					<c:set var="list" value="${list}" />
					<div class="row">

						<c:forEach var="dto" begin="0" end="3" items="${list}">
							<div class="col-sm-3">
								<div class="tm-gallery-page" id="tm-gallery-page-1">

									<div class="col-10 col-10-medium">
										<!-- Box -->
										<section class="box feature">
											<div class="mainimg">
												<a href="/club/read/${dto.clID}" class="img-rounded"> <img
													src="/club/storage/${dto.fileName}" alt="" width="250"
													height="250" />
												</a>
											</div>
											<div class="info">
												<h6 class="card-title2">${dto.title}</h6>
												<div style="color: #808088">
													<i class="fas fa-user"></i>&nbsp<span class="card-text">${dto.nickname}
													</span>
												</div>
												<span class="card-text2">조회 ${dto.viewcnt} &nbsp
													Date: ${dto.rdate.substring(0,10)} </span> <br> <br> <br>
											</div>
										</section>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="row">

						<c:forEach var="dto" begin="4" end="7" items="${list}">
							<div class="col-sm-3">
								<div class="tm-gallery-page" id="tm-gallery-page-1">

									<div class="col-10 col-10-medium">
										<!-- Box -->
										<section class="box feature">
											<a href="/club/read/${dto.clID}" class="img-rounded"> <img
												src="/club/storage/${dto.fileName}" alt="" width="250"
												height="250" />

											</a>
											<div class="info">

												<h6 class="card-title">${dto.title}</h6>
												<div style="color: #808088">
													<i class="fas fa-user"></i>&nbsp<span class="card-text">${dto.nickname}</span>
												</div>
												<span class="card-text2">조회 ${dto.viewcnt} &nbsp
													Date: ${dto.rdate.substring(0,10)} </span>
											</div>
										</section>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div style="margin-top: 30px; margin-left: 10px;">${paging}</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
