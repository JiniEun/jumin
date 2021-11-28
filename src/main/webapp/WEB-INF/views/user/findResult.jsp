<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/resources/static/css/user_loginForm.css">
</head>
<body>
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="col mb-4 txt-center">회원 조회 결과</h2>
				<div class="l-flex p-80 mb-3">
					<h1>${result }</h1>
					<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
						<button type="button" class="btn btn-color login-btn"
							onclick="location.href='../'">메인으로 돌아가기</button>

						<button type="button" class="btn btn-color login-btn"
							onclick="location.href='../'">회원 찾기로 돌아가기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>