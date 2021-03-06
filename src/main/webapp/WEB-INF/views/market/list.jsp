<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 메인 페이지</title>
<link rel="stylesheet" href="/resources/static/css/market_list.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	function read(mid) {
		var url = "read";
		url += "?mid=" + mid;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	$(document).ready(function() {
		var value = $('#category').val();
		if (value == "") {
			$('#ct').focus();
		} else if (value == "가구") {
			$('#c1').focus();
		} else if (value == "전자") {
			$('#c2').focus();
		} else if (value == "의류") {
			$('#c3').focus();
		} else if (value == "기타") {
			$('#c4').focus();
		}
	});
</script>
</head>
<body>
	<div id="features-wrapper">
		<div class="container-lg">
			<div id="top" class="mb-4">
				<h2 class="col-12 text-center tm-section-title">동네 장터</h2>
				<p class="col-12 text-center">
					다양한 물품들을 서로 거래해 보세요.<br> <br>
					<c:choose>
						<c:when
							test="${not empty sessionScope.ID && sessionScope.grade == 'H'}">
							<button type="button" class="btn"
								onclick="location.href='../market/create'"
								style="border-color: #5BA6A6; color: #5BA6A6;">상품등록하기</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn"
								onclick="location.href='../user/login'"
								style="border-color: #5BA6A6; color: #5BA6A6;">상품등록하기</button>
						</c:otherwise>
					</c:choose>

				</p>
			</div>
			<div class="tm-paging-links m-4">
				<input type="hidden" id="category" name="category" value="${cate }" />
				<form class="tm-paging-item" method="post" name="form">
					<input type="submit" class="btn btn-cg tm-paging-link mr-3"
						name="col" value="total" id="ct"
						onclick="javascript: form.action='./list';" /><input
						type="submit" class="btn btn-cg tm-paging-link mr-3"
						name="category" id="c1" value="가구"
						onclick="javascript: form.action='./list';" /> <input
						type="submit" class="btn btn-cg tm-paging-link mr-3"
						name="category" id="c2" value="전자"
						onclick="javascript: form.action='./list';" /> <input
						type="submit" class="btn btn-cg tm-paging-link mr-3"
						name="category" id="c3" value="의류"
						onclick="javascript: form.action='./list';" /> <input
						type="submit" class="btn btn-cg tm-paging-link" name="category"
						id="c4" value="기타" onclick="javascript: form.action='./list';" />

				</form>
			</div>
			<form class="form-inline" action="./list">
				<div class="form-group">
					<select class="form-control" name="col" style="margin-right: 10px;">
						<option value="total"
							<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
						<option value="nickname"
							<c:if test= "${col=='nickname'}"> selected </c:if>>닉네임</option>
						<option value="title"
							<c:if test= "${col=='title'}"> selected </c:if>>제목</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요"
						name="word" value="${word}" style="margin-right: 10px;">
				</div>
				<button type="submit" class="btn"
					style="background-color: #5BA6A6; color: white; margin-right: 10px;">검색</button>
			</form>
			<c:set var="list" value="${list}" />
			<div class="row">

				<c:forEach var="dto" begin="0" end="3" items="${list}">
					<div class="col-sm-3">
						<div class="tm-gallery-page" id="tm-gallery-page-1">

							<div class="col-10 col-10-medium">
								<!-- Box -->
								<section class="box feature">
									<div class="mainimg">
										<a href="javascript:read('${dto.mid}')" class="images"> <img
											class="l-img"
											src="/market/storage/${fn:split(dto.filename,',')[0]}" alt=""
											width="236" height="250" />
										</a>
									</div>
									<div class="info">
										<h6 class="card-title">${dto.title}</h6>
										<div style="color: #808088">
											<i class="fas fa-user"></i>&nbsp<span class="card-text">${dto.nickname}</span>
										</div>
										<br> <span class="card-text">카테고리 :
											${dto.category}</span><br> <span class="card-text">조회수 :
											${dto.viewcnt}</span>
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
									<a href="javascript:read('${dto.mid}')" class="images"> <img
										class="l-img"
										src="/market/storage/${fn:split(dto.filename,',')[0]}" alt=""
										width="236" height="250" />
									</a>
									<div class="info">

										<h6 class="card-title">${dto.title}</h6>
										<div style="color: #808088">
											<i class="fas fa-user"></i>&nbsp<span class="card-text">${dto.nickname}</span>
										</div>
										<br> <span class="card-text">카테고리 :
											${dto.category}</span><br> <span class="card-text">조회수 :
											${dto.viewcnt}</span>
									</div>
								</section>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


			<div style="margin-top: 30px; margin-left: 10px;">${paging}</div>
		</div>
	</div>
</body>