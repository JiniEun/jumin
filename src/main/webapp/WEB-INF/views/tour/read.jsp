<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/static/css/tour_read.css">
<style>
.carousel-inner>.carousel-item>img {
	width: 1080px;
	height: 720px;
	object-fit: contain;
}

.carousel-inner>.carousel-item active>img {
	width: 1080px;
	height: 720px;
	object-fit: contain;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script>
	$('.carousel').carousel({
		interval : 2000
	})
</script>


<script type="text/javascript">
	function show(star) {
		switch (star) {
		case 1:
			stateMsg = "★☆☆☆☆"
		case 2:
			stateMsg = "★★☆☆☆"
		case 3:
			stateMsg = "★★★☆☆"
		case 4:
			stateMsg = "★★★★☆"
		case 5:
			stateMsg = "★★★★★"

		}
	}

	function updateM() {
		var url = "/tour/update";
		url += "?tid=${dto.tid}";
		location.href = url;
	}
	function deleteM() {
		var url = "/tour/delete";
		url += "?tid=${dto.tid}";
		location.href = url;
	}

	function snsShare(snsName, title) {

		if (title === null)
			return false;

		//var link=window.location.host+window.location.pathname+window.location.search
		var link = "www.naver.com"
		var snsPopUp;
		var _width = '500';
		var _height = '450';
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.height - _height) / 2);

		switch (snsName) {
		case 'facebook':
			snsPopUp = window.open(
					"http://www.facebook.com/sharer/sharer.php?u=" + link, '',
					'width=' + _width + ', height=' + _height + ', left='
							+ _left + ', top=' + _top);
			break;

		case 'twitter':
			snsPopUp = window.open("http://twitter.com/intent/tweet?url="
					+ link + "&text=" + title, '', 'width=' + _width
					+ ', height=' + _height + ', left=' + _left + ', top='
					+ _top);
			break;

		case 'kakao':
			snsPopUp = window.open("https://story.kakao.com/share?url=" + link,
					'', 'width=' + _width + ', height=' + _height + ', left='
							+ _left + ', top=' + _top);
			break;

		case 'addurl':
			var dummy = document.createElement("textarea");
			document.body.appendChild(dummy);
			dummy.value = link;
			dummy.select();
			document.execCommand("copy");
			document.body.removeChild(dummy);
			oneBtnModal("URL이 클립보드에 복사되었습니다.");
			break;
		}
	}
</script>

<title>동네스팟 조회</title>
</head>
<body>
	<div class="container">
		<!-- Slide -->
		<div id="demo" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<!-- 슬라이드쇼 -->
				<div class="carousel-item active">
					<!-- 가로 -->
					<img class="l-img" class="d-block w-100"
						src="/tour/storage/${fn:split(dto.filename,',')[0]}"
						alt="First Slide"
						style="width: 100%; height: 500px; object-fit: contain;">

					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<script>
					
				</script>

				<c:forEach var="dto" items="${dto.filename}" varStatus="status">
					<div class="carousel-item">
						<c:forEach var="filename" items="${fn:split(dto,',')}">
							<img class="l-img" src="/tour/storage/${filename}"
								alt="iuhello.jpg"
								style="width: 100%; height: 500px; object-fit: contain;">

						</c:forEach>
					</div>
				</c:forEach>


			</div>

			<!-- 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"
				style="height: 40px; width: 40px; outline: black; background-color: #5BA6A6; background-size: 100%, 100%; border-radius: 50%; border: 2px solid #5BA6A6;"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"
				style="height: 40px; width: 40px; outline: black; background-color: #5BA6A6; background-size: 100%, 100%; border-radius: 50%; border: 2px solid #5BA6A6;"></span>
			</a>
			<ul class="carousel-indicators">

				<li data-target="#demo" data-slide-to="0" class="active"></li>

				<c:forEach var="dto" items="${dto.filename}" varStatus="status">
					<li data-target="#demo" data-slide-to="${status.count}"></li>
				</c:forEach>

			</ul>
		</div>

		<!-- 내용 -->
		<section class="title">
			<span class="stitle"><i class="fab fa-slack-hash"></i>&nbsp${dto.title}</span>
			<div class="sharebtn">
				<a href="https://map.naver.com/v5/search/${dto.addname}"
					target="_blank"><i class="fas fa-map-marked"></i></a>
				<button onclick="snsShare('kakao')">
					<img class="l-img"
						src="/resources/static/images/logo/kakao_logo.png">
				</button>
				<button onclick="snsShare('twitter')">
					<img class="l-img"
						src="/resources/static/images/logo/twitter_logo.png">
				</button>
				<button onclick="snsShare('facebook')">
					<img class="l-img"
						src="/resources/static/images/logo/facebook_logo.png">
				</button>
			</div>
		</section>

		<section class="info">
			<span class="writer">작성자 : ${dto.nickname}</span> <span class="score">평점
				: <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if> <c:if
					test="${dto.score=='2'}">★★☆☆☆</c:if> <c:if
					test="${dto.score=='3'}">★★★☆☆</c:if> <c:if
					test="${dto.score=='4'}">★★★★☆</c:if> <c:if
					test="${dto.score=='5'}">★★★★★</c:if>
			</span> <span class="date">작성일자 : ${dto.rdate.substring(0,10)}</span>
		</section>

		<section class="contents mt-4 mb-4">
			<article>
				<p style="white-space: pre-line;">${dto.contents}</p>
			</article>
		</section>

		<!-- reply -->
		<form name="replyForm">
			<section class="reply mb-4">
				<input type="hidden" name="tid" value="${dto.tid}" /> <input
					type="text" class="form-control" id="content" name="content"
					placeholder="로그인 후 댓글을 달아주세요">
				<button class="rebtn" id="rebtn" name="rebtn">댓글 등록</button>
			</section>

			<section class="reshow mb-3">
				<div class="replyList"></div>
			</section>

		</form>

		<div class="l-section-btn mr-5">

			<button type="button" class="btn movebtn mr-2"
				onclick="location.href='../tour/list'">목록</button>
			<button type="button" class="btn movebtn mr-2" onclick="updateM()">수정</button>
			<button type="button" class="btn movebtn" onclick="deleteM()">삭제</button>

		</div>


	</div>



	<%@ include file="reply.jsp"%>

</body>
</html>