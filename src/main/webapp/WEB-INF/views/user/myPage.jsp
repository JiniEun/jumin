<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card {
	max-width: 680px;
	margin-top: 50px;
	padding: 30px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
</head>
<body>
	<div class="container-lg" style="margin-top: 10px;">
		<h2>나의 정보</h2>
		<div class="card card-default" style="max-width: 900px;">
			<div class="row g-0">
				<div class="col-md-4">
					<div class="d-flex justify-content-center">
						<c:choose>
							<c:when test="${empty dto.fileName}">
								<img src="/images/profile.png" class="img-fluid rounded-start"
									alt="img">
							</c:when>
							<c:otherwise>
								<img src="/user/storage/${dto.fileName }" class="img-rounded"
									width="200px" height="200px">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title">아이디</h5>
						<p class="card-text">${dto.ID}</p>

						<h5 class="card-title">성명</h5>
						<p class="card-text">${dto.uname}</p>

						<h5 class="card-title">별명</h5>
						<p class="card-text">${dto.nickname}</p>

						<h5 class="card-title">성별</h5>
						<p class="card-text">${dto.gender}</p>

						<h5 class="card-title">생년월일</h5>
						<p class="card-text">${dto.birth}</p>

						<h5 class="card-title">이메일 주소</h5>
						<p class="card-text">${dto.email}</p>

						<h5 class="card-title">전화번호</h5>
						<p class="card-text">${dto.phone }</p>

						<h5 class="card-title">주소</h5>
						<p class="card-text">${dto.address1 }</p>
						<p class="card-text">${dto.address2 }</p>

					</div>
				</div>
			</div>
		</div>
		<br>
		<div>
			<button type="button" class="btn btn-color"
				onclick="location.href='update'">회원 정보 변경</button>
		</div>
	</div>
</body>
</html>