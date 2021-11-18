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

.cards {
	margin: 10px 10px 20px; /*위, 가로방향, 아*/
}
</style>
<script>
	function inCheck(f) {
		if (f.nickname.value.length == 0) {
			alert("별명을 입력하세요");
			f.nickname.focus();
			return false;
		}
		if (f.password.value.length == 0) {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if (f.repassword.value.length == 0) {
			alert("비번확인을 입력하세요");
			f.repassword.focus();
			return false;
		}
		if (f.password.value != f.repassword.value) {
			alert("비번과 비번확인이 일치하지 않습니다.");
			f.password.value = "";
			f.repassword.value = "";
			f.password.focus();
			return false;
		}
		if (f.phone.value.length == 0) {
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return false;
		}
	}

	function deleteM() {
		var url = "../user/delete";
		url += "?ID=${dto.ID}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container-lg" style="margin-top: 10px;">
		<h2>나의 정보</h2>
		<div class="card card-default" style="max-width: 900px;">
			<form class="updateform" novalidate action="update" method="post"
				name='frm' enctype="multipart/form-data"
				onsubmit="return inCheck(this)">
				<div class="row g-0">
					<div class="col-md-4">
						<div class="d-flex justify-content-center" style="margin-bottom:10px;">
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
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-color" onclick="location.href='updateFile'">프로필 사진 변경</button>
						</div>
					</div>
					<div class="col-md-8">
						<div class="card-body">

							<div class="cards">
								<h5 class="card-title">아이디</h5>
								<p class="card-text">${dto.ID}</p>
								<input type="hidden" id="ID" name="ID" value="${dto.ID}">
							</div>

							<div class="cards">
								<h5 class="card-title">성명</h5>
								<p class="card-text">${dto.uname}</p>
							</div>

							<div class="cards">
								<h5 class="card-title">별명</h5>
								<div class="col-md-6 mb-3">
									<input type="text" class="form-control" id="nickname"
										placeholder="${dto.nickname}" name="nickname"
										value="${dto.nickname}" required>
								</div>
							</div>

							<div class="cards">
								<h5 class="card-title">성별</h5>
								<p class="card-text">${dto.gender}</p>
							</div>

							<div class="cards">
								<h5 class="card-title">생년월일</h5>
								<p class="card-text">${dto.birth}</p>
							</div>

							<div class="cards">
								<h5 class="card-title">이메일 주소</h5>
								<div class="col-md-6 mb-3">
									<input type="text" class="form-control col" id="email"
										placeholder="${dto.email}" name="email" value="${dto.email}"
										required>
								</div>
							</div>

							<div class="cards">
								<h5 class="card-title">전화번호</h5>
								<div class="col-md-6 mb-3">
									<input type="tel" class="form-control" id="phone" name="phone"
										placeholder="${dto.phone }"
										pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${dto.phone }"
										required>
								</div>
							</div>

							<div class="cards">
								<h5 class="card-title">주소</h5>
								<div class="mb-3">
									<label for="address">주소</label> <input type="text"
										class="form-control" id="address1" name="address1"
										placeholder="${dto.address1 }" value="${dto.address1 }"
										required>
									<div class="invalid-feedback">주소를 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
											아님)</span></label> <input type="text" class="form-control" id="address2"
										name="address2" placeholder="${dto.address2 }"
										value="${dto.address2 }">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-top: 20px;">
					<button type="submit" class="btn btn-color">회원 정보 수정</button>
					<button type="button" class="btn btn-color" onclick="deleteM()">회원
						탈퇴</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>