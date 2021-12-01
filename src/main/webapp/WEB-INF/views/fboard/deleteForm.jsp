<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>친구게시판 삭제</title>
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
				<h3 class="col-sm-offset-2 col-sm-10">동네친구 게시물 삭제</h3>
				<form class="form-horizontal" action="/fboard/delete" method="post">
				<input type="hidden" name="fbID" value="${dto.fbID}">
				<input type="hidden" name="userID" value="${dto.userID}">

					<p id="red" class="col-sm-offset-2 col-sm-6">게시물을 삭제하면 복구할 수 없습니다</p>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<button type="submit" class="btn btn-color">삭제</button>
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