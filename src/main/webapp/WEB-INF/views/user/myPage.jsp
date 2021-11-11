<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="container-lg">
        <h2>나의 정보</h2>
        <div class="card card-default" style="max-width: 900px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="../회원관련/images/profile.png" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">성명</h5>
                        <p class="card-text">개발자 1</p>

                        <h5 class="card-title">아이디</h5>
                        <p class="card-text">아이디입니다.</p>

                        <h5 class="card-title">성별</h5>
                        <p class="card-text">여자</p>

                        <h5 class="card-title">생년월일</h5>
                        <p class="card-text">11.04.2010</p>

                        <h5 class="card-title">이메일 주소</h5>
                        <p class="card-text">you@example.com</p>

                        <h5 class="card-title">전화번호</h5>
                        <p class="card-text">010-0000-0000</p>

                        <h5 class="card-title">주소</h5>
                        <p class="card-text">주소입니다.</p>

                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div>
            <button type="button" class="btn btn-color">회원 정보 변경</button>
            <button type="button" class="btn btn-color">회원 탈퇴</button>
        </div>
    </div>
</body>
</html>