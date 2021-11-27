<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<meta charset="utf-8">
<style type="text/css">
#red {
	color: red;
}

.input-form {
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
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="col-sm-offset-2 col-sm-10">아이디 찾기</h2>
				<form class="form-horizontal" action="/user/idfind" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">이메일</label>
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control col" id="email"
								placeholder="you@example.com" name="email" required>
							<div class="invalid-feedback"></div>
						</div>
						<label class="control-label col-sm-2" for="phone">전화번호</label>
						<div class="col-sm-6">
							<input type="tel"
							class="form-control" id="phone" name="phone" placeholder="010-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
						</div>
					</div>

					<p id="red" class="col-md">회원 정보에 입력된 이메일과 전화번호를 입력하세요.</p>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<button type="submit" class="btn btn-color" onclick="location.href='idfindresult'">아이디 찾기</button>
							<button type="button" class="btn btn-color"
								onclick="history.back()">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="input-form col-md-12 mx-auto">
				<h2 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h2>
				<form class="form-horizontal" action="/user/pwfind" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="ID">ID</label>
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control col" id="ID"
								placeholder="Enter ID" name="ID" required>
						</div>
						<label class="control-label col-sm-2" for="email">이메일</label>
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control col" id="email"
								placeholder="you@example.com" name="email" required>
							<div class="invalid-feedback"></div>
						</div>
						<label class="control-label col-sm-2" for="phone">전화번호</label>
						<div class="col-sm-6">
							<input type="tel" class="form-control" id="phone" name="phone"
								placeholder="010-0000-0000" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
								required>
						</div>
					</div>

					<p id="red" class="col-md">회원 정보에 입력된 아디이와 이메일, 전화번호를 입력하세요.</p>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<button class="btn btn-color"
								onclick="location.href='pwfindresult'">비밀번호 찾기</button>
							<button type="button" class="btn btn-color"
								onclick="history.back()">취소</button>
						</div>
					</div>
				</form>
			</div>
	</div>
</body>
</html>