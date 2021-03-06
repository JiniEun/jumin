<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when
		test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
		<c:set var="str">관리자로 로그인 하셨습니다. ${sessionScope.regionName} 지역 접속 </c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.ID && sessionScope.grade != 'A'}">
		<c:set var='str'>안녕하세요  ${sessionScope.ID } 님! ${sessionScope.regionName} 지역 접속</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">안녕하세요 방문자님! ${sessionScope.regionName} 지역 접속 </c:set>
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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/static/css/top.css">
</head>
<body>
	<!--상단메뉴-->
	<nav class="navbar-nav header-top">
		<div class="container-fluid">
			<div class="float-left">
				<a id="grade" style="color: #bebebc;"><span
					class="glyphicon glyphicon-grain greet-ment">${str}</span> </a>
			</div>
			<div class="float-right">
				<input type="hidden" value="<c:out value='${sessionScope.ID}'/>"
					id="session_id" />
				<c:choose>
					<c:when test="${empty sessionScope.ID }">
						<a href="${root}/user/create" tabindex="-1" aria-disabled="true"
							class="link-header-right">sign up</a>
						<a href="${root}/user/login" class="btn btn-sm btn-color-header"
							tabindex="-1" role="button" aria-disabled="true">login</a>
					</c:when>
					<c:when
						test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
						<a href="${root}/user/mypage" tabindex="-1" aria-disabled="true"
							class="link-header-right">My Page</a>
						<a href="${root}/user/list" class="btn btn-sm btn-color-header"
							tabindex="-1" role="button" aria-disabled="true"
							style="margin-right: 10px;">setting</a>
						<a href="${root}/user/logout" class="btn btn-sm btn-color-header"
							tabindex="-1" role="button" aria-disabled="true">logout</a>
					</c:when>
					<c:otherwise>
						<a href="${root}/user/mypage" tabindex="-1" aria-disabled="true"
							class="link-header-right">My Page</a>
						<a href="${root}/message/list" tabindex="-1" aria-disabled="true"
							class="link-header-right"><i class="bi bi-messenger"
							style="font-size: 1.5rem;"></i></a>
						<a href="${root}/user/logout" class="btn btn-sm btn-color-header"
							tabindex="-1" role="button" aria-disabled="true">logout</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<nav class="navbar-nav">
		<div class="nav justify-content-center">
			<a class="navbar-brand" href="${root}/" style="color: #027373;">
				<img src="/images/dongnefff.gif" width="100%" height="auto" alt="logo" />
			</a>
		</div>
	</nav>

	<nav class="navbar sticky-top bg-light-color navbar-expand-lg navbar-light">
		<div class="navbar-collapse collapse justify-content-center"
			id="navbarSupportedContent">
			<ul class="nav navbar-nav navbar-center justify-content-center">
				<li class="nav-item active"><a class="nav-link" href="${root}/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDarkDropdownMenuLink" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 동네 나들이 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${root}/office/list">주요시설</a> <a
							class="dropdown-item" href="${root}/tour/list">동네스팟</a>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					href="${root}/market/list">동네 장터</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDarkDropdownMenuLink" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 동네 모임 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${root}/club/list">동호회</a> <a
							class="dropdown-item" href="${root}/fboard/list">동네친구</a>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					href="${root}/community/list">동네 커뮤니티</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>