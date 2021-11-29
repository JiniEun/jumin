<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/resources/static/css/user_findresult.css">
</head>
<body>
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="col mb-4 txt-center">회원 조회 결과</h2>
				<div>
					<p class="txt-result">${result }</p>
				</div>
				<div class="l-flex p-150 mb-0">
					<div class="form-group col-sm l-flex itm-center pl-0 pr-0">
						<button type="button" class="btn btn-color back-btn"
							onclick="location.href='../'">메인으로 돌아가기</button>

						<button type="button" class="btn btn-color back-btn"
							onclick="location.href='./userfind'">
							회원 찾기로<br> 돌아가기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>