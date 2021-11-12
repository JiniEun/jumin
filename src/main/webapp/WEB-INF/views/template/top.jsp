<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when
		test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
		<c:set var="str">관리자입니다.</c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.ID && sessionScope.grade != 'A'}">
		<c:set var='str'>안녕하세요  ${sessionScope.ID } 님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<title>memo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
<style type="text/css">
.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
</head>
<body>
	<!--상단메뉴-->
	<nav class="navbar-nav">
		<div class="container-fluid" style="margin-top: 5px;">
			<div class="float-left">
				<a id="grade" style="color: black;"><span
					class="glyphicon glyphicon-grain" style="color: black;"></span>
					${str}</a>
			</div>
			<div class="float-right">
				<c:choose>
					<c:when test="${empty sessionScope.ID }">
						<a href="${root}/user/create" tabindex="-1" aria-disabled="true"
							style="color: #5BA6A6; margin-right: 10px;">sign up</a>
						<a href="${root}/user/login" class="btn btn-sm btn-color"
							tabindex="-1" role="button" aria-disabled="true">login</a>
					</c:when>
					<c:when
						test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
						<a href="${root}/user/mypage" tabindex="-1" aria-disabled="true"
							style="color: #5BA6A6; margin-right: 10px;">My Page</a>
						<a href="${root}/user/mypage" class="btn btn-sm btn-color"
							tabindex="-1" role="button" aria-disabled="true" style="margin-right: 10px;">setting</a>
						<a href="${root}/user/logout" class="btn btn-sm btn-color"
							tabindex="-1" role="button" aria-disabled="true">logout</a>
					</c:when>
					<c:otherwise>
						<a href="${root}/user/mypage" tabindex="-1" aria-disabled="true"
							style="color: #5BA6A6; margin-right:10px;">My Page</a>
						<a href="${root}/user/logout" class="btn btn-sm btn-color"
							tabindex="-1" role="button" aria-disabled="true">logout</a>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>
	<nav class="navbar-nav">
		<div class="nav justify-content-center">
			<a class="navbar-brand" href="${root}/" style="color: #5BA6A6;">Logo
				image</a>
		</div>
	</nav>

	<nav class="navbar navbar-expand-lg navbar-light">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="${root}/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 동네 이모저모 </a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="#">지역 정보</a></li>
								<li><a class="dropdown-item" href="#">코로나 현황</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 동네 나들이 </a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="#">관공서</a></li>
								<li><a class="dropdown-item" href="#">여행지</a></li>
							</ul></li>
					</ul>
				</div>
				<li class="nav-item"><a class="nav-link"
					href="./market_main.html">동네 장터</a></li>
				<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 동네 모임 </a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="${root}/club/list">동호회</a></li>
								<li><a class="dropdown-item" href="#">동네친구</a></li>
							</ul></li>
					</ul>
				</div>
				<li class="nav-item"><a class="nav-link" href="#">동네 커뮤니티</a></li>
				<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 고객센터 </a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="${root}/notice/list">공지사항</a></li>
								<li><a class="dropdown-item" href="${root}/notice/chatbot">Q&A</a></li>
							</ul></li>
					</ul>
				</div>

				<!-- <li class="nav-item">
                    <a class="nav-link disabled" href="#">고객센터</a>
                </li> -->
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn my-2 my-sm-0" type="submit"
					style="background-color: #5BA6A6; color: white;">Search</button>
			</form>
		</div>
	</nav>
</body>
</html>