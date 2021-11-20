<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 이미지 수정</title>
<meta charset="utf-8">
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

	<div class="container">
		<div class="card">
			<h1 class="col-sm-offset-2 col-sm-10">회원 이미지 수정</h1>
			<form class="form-horizontal" action="updateFile" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="oldfile" value="${param.oldfile}">

				<div class="form-group">
					<label class="control-label col-sm-2" for="oldfile">원본파일</label>
					<div class="col-sm-6">
						<img src="/user/storage/${param.oldfile }" class="img-rounded"
							width="200px" height="200px">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="fnameMF">변경파일</label>
					<div class="col-sm-6">
						<input type="file" class="form-control" id="fnameMF"
							name="fnameMF" accept=".jpg,.png,.gif" required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-color">수정</button>
						<button type="button" class="btn btn-color"
							onclick="history.back()">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>