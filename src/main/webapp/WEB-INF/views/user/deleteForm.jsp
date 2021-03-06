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
				<h2 class="col-sm-offset-2 col-sm-10">회원탈퇴</h2>
				<form class="form-horizontal" action="/user/delete" method="post">
					<input type="hidden" name="ID" value="${ID}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="password">비밀번호</label>
						<div class="col-sm-6">
							<input type="password" name="password" id="password"
								class="form-control">
						</div>
					</div>

					<p id="red" class="col-sm-offset-2 col-sm-6">탈퇴하면 복구할 수 없습니다</p>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<button class="btn btn-color" onclick="location.href='delete'">탈퇴</button>
							<button type="button" class="btn btn-color"
								onclick="history.back()">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>