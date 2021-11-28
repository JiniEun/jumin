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
				<h2 class="col mb-4 txt-center">로그인</h2>
				<form class="form-horizontal" action="login" method="post">
					<div class="l-flex p-80 mb-3">
						<div class="col pl-0 pr-0">
							<div class="form-group col-sm l-flex itm-center pl-0">
								<label for="ID">아이디</label> <input type="text"
									class="form-control w-70" id="ID" placeholder="Enter id"
									name="ID" required="required" value=''>
							</div>
							<div class="form-group col-sm l-flex itm-center pl-0 mb-0">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control w-70" id="password"
									placeholder="Enter password" name="password"
									required="required">
							</div>
						</div>
						<div class="col-sm-3 pl-0 pr-0">
							<button type="submit" class="btn btn-color login-btn"
								onclick="location.href='../'">로그인</button>
						</div>
					</div>
					<div class="form-group col-sm l-flex p-80">
						<div class="checkbox">
							<label> <input type="checkbox" name="c_id" value="Y"
								checked="checked"> Remember ID
							</label>
						</div>
						<div>
							<a class="a-color mr-2" href='create'>회원가입</a> 
							<a class="a-color" href='userfind'>아이디/비밀번호 찾기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>