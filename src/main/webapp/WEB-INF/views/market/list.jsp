<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 메인 페이지</title>
<style>
#form {
	padding: 2em 0 2em 0;
}

#top {
	padding: 2em 0 4em 0;
}

#g1 {
	
	margin-bottom: 40px;
}

.tm-paging-item {
	list-style: none;
	display: inline-block;
	border: 1px solid #5BA6A6;
	margin: 7px;
}

.tm-paging-link {
	padding: 10px 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	color: #5BA6A6;
	background-color: transparent;
}

.tm-paging-link.active, 
.tm-paging-link:hover {
	background-color: #5BA6A6;
	color: white;
	text-decoration: none;
}
</style>

<script>
function read(mid){
    var url = "read";
    url += "?mid="+mid;
    url += "&col=${col}";
    url += "&word=${word}";
    url += "&nowPage=${nowPage}";
    location.href=url;
}
$(document).ready(function(){
	// Handle click on paging links
	$('.tm-paging-link').click(function(e){
		e.preventDefault();
		
		var page = $(this).text().toLowerCase();
		$('.tm-gallery-page').addClass('hidden');
		$('#tm-gallery-page-' + page).removeClass('hidden');
		$('.tm-paging-link').removeClass('active');
		$(this).addClass("active");
	});
});



</script>
</head>
<body>

	<div id="features-wrapper">
		<div class="container">
			<div id="top">
				<h2 class="col-12 text-center tm-section-title">동네 장터</h2>
				<p class="col-12 text-center">
					다양한 물품들을 서로 거래해 보세요.<br> <br>
					<c:choose>
						<c:when test="${not empty sessionScope.ID && sessionScope.grade == 'H'}">
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

			<div class="tm-paging-links">
				<nav >
					
					<ul id="g1" class="col-12 text-center">
					
						<li class="tm-paging-item" id="one" ><a href="#" class="tm-paging-link active" >
						가구</a></li>
						<li class="tm-paging-item" ><a href="#" class="tm-paging-link" >
						전자</a></li>
						<li class="tm-paging-item" ><a href="#" class="tm-paging-link">
						의류</a></li>
						<li class="tm-paging-item" ><a href="#"class="tm-paging-link">					
						기타</a></li>
					
					</ul>
					
				
				</nav>
			</div>
			
			
			
			<c:set var="list" value="${list}" />
			<div class="row">
					
					<c:forEach var="dto" begin="0" end="7" items="${list}">
					<div class="col-sm-3">
					<div class="tm-gallery-page" id="tm-gallery-page-1">

					<div class="col-10 col-10-medium">					
						<!-- Box -->
						<section class="box feature">
							<a href="javascript:read('${dto.mid}')" class="image featured">
							<img src="/market/storage/${fn:split(dto.filename,',')[0]}" alt="" width="300" height="300" /></a>
							<div class="inner">
								<header>
									<h4>${dto.title}</h4>
									<p>조회수 : ${dto.viewcnt}</p>									
									<p>작성자 : ${dto.nickname}</p>	
									<p>카테고리 : ${dto.category}</p>								
								</header>
								<p>지역 : </p>
							</div>
						</section>
					</div>
					</div>
					</div>
				</c:forEach>
			
			</div>
			
	
<%-- 			<c:forEach var="dto" begin="4" end="7" items="${list}">	 --%>
<!-- 				<div class="tm-gallery-page hidden" id="tm-gallery-page-2"> -->
			
<!-- 				<div class="col-4 col-12-medium"> -->

<!-- 					Box -->
<!-- 					<section class="box feature"> -->
<%-- 						<a href="/market/read/${dto.mid}" class="image featured"><img --%>
<%-- 							src="/market/storage/${fn:split(dto.filename,',')[0]}" alt="" width="300" --%>
<!-- 							height="300" /></a> -->
<!-- 						<div class="inner"> -->
<!-- 							<header> -->
<%-- 								<h4>${dto.title}</h4> --%>
<%-- 								<p>${dto.id}</p> --%>
								
<!-- 							</header> -->
<!-- 							<p>서울시 강남구</p> -->
<!-- 						</div> -->
<!-- 					</section> -->
<!-- 				</div> -->
			
<!-- 				</div> -->
<%-- 			</c:forEach>	 --%>
<%-- 			<c:forEach var="dto" begin="4" end="7" items="${list}"> --%>
<!-- 				<div class="tm-gallery-page hidden" id="tm-gallery-page-3"> -->
				
<!-- 				<div class="col-4 col-12-medium"> -->

<!-- 					Box -->
<!-- 					<section class="box feature"> -->
<!-- 						<a href="/market/read/" class="image featured"><img -->
<%-- 							src="/market/storage/${fn:split(dto.filename,',')[0]}" alt="" width="300" --%>
<!-- 							height="300" /></a> -->
<!-- 						<div class="inner"> -->
<!-- 							<header> -->
<%-- 								<h4>${dto.title}</h4> --%>
<%-- 								<p>${dto.id}</p> --%>
								
<!-- 							</header> -->
<!-- 							<p>서울시 강남구</p> -->
<!-- 						</div> -->
<!-- 					</section> -->
<!-- 				</div> -->
				
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<%-- 			<c:forEach var="dto" begin="4" end="7" items="${list}"> --%>
<!-- 			<div class="tm-gallery-page hidden" id="tm-gallery-page-4"> -->
			
				
<!-- 				<div class="col-4 col-12-medium"> -->

<!-- 					Box -->
<!-- 					<section class="box feature"> -->
<!-- 						<a href="/market/read/" class="image featured"><img -->
<%-- 							src="/market/storage/${fn:split(dto.filename,',')[0]}" alt="" width="300" --%>
<!-- 							height="300" /></a> -->
<!-- 						<div class="inner"> -->
<!-- 							<header> -->
<%-- 								<h4>${dto.title}</h4> --%>
<%-- 								<p>${dto.id}</p> --%>
								
<!-- 							</header> -->
<!-- 							<p>서울시 강남구</p> -->
<!-- 						</div> -->
<!-- 					</section> -->
<!-- 				</div> -->
				
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
		${paging}
		</div>
	</div>
</body>