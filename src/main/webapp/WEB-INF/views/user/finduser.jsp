<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/resources/static/css/user_finduser.css">
</head>
<body>
	<div class="container-fluid l-ct">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="col mb-3 txt-center">아이디 찾기</h2>
				<p class="col-md txt-info mb-5">회원 정보에 입력된 이메일과 전화번호를 입력하세요.</p>
				<form class="form-horizontal" action="idfind" method="post">
					<div class="l-flex p-60 mb-3">
						<div class="col pl-0 pr-0">

							<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
								<input type="text" class="form-control col" id="email"
									placeholder="이메일 ex) you@example.com" name="email" required>
							</div>
							<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
								<input type="tel" class="form-control mb-3" id="phone" name="phone"
									placeholder="전화번호 ex) 010-0000-0000"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
							</div>
							<div class="form-group col-sm l-flex itm-center w-100 pr-0 pl-0 mb-0">
								<button type="submit" class="btn btn-color find-btn"
									onclick="location.href='idfind'">아이디 찾기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="col mb-3 txt-center">비밀번호 찾기</h2>
				<p class="col-md txt-info mb-4">회원 정보에 입력된 아이디와 이메일, 전화번호를 입력하세요.</p>
				<form class="form-horizontal" action="idfind" method="post">
					<div class="l-flex p-70 mb-3">
						<div class="col pl-0 pr-0">

							<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
								<input type="text" class="form-control col" id="ID"
									placeholder="아이디 ex) ID" name="ID" required>
							</div>
							<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
								<input type="text" class="form-control col" id="email"
									placeholder="이메일 ex) you@example.com" name="email" required>
							</div>
							<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
								<input type="tel" class="form-control" id="phone" name="phone"
									placeholder="전화번호 ex) 010-0000-0000"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
							</div>
							<div class="form-group col-sm l-flex itm-center pl-0 pr-0 mb-0">
								<button type="submit" class="btn btn-color find-btn"
									onclick="location.href='idfind'">아이디 찾기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>