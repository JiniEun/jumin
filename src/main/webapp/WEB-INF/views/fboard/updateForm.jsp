<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네친구 게시물 수정</title>
<style>
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
	<div class="container-fluid">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">동네친구 게시물 수정</h4>
				<form class="validation-form" novalidate action="/fboard/update"
					method="post" name='frm' enctype="multipart/form-data">
					<input type="hidden" name="fbID" value="${dto.fbID}">
					<div class="form-group" hidden>
						<label class="control-label col-sm-2" for="userID">작성자ID</label>
				 		<input type="text" readonly name="userID" id="userID" class="form-control" value="${dto.userID}">
					</div>
					<div class="mb-3">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control" value="${dto.title }">
					</div>
					<div class="mb-3">
						<label for="nickname">작성자</label>
						<input type="text" readonly name="nickname" id="nickname" class="form-control" value="${dto.nickname}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea rows="12" cols="7" id="content" name="content"
							class="form-control">${dto.content }</textarea>
					</div>
					<div class="mb-3" style="margin-top:10px;">
						<button type="submit" class="btn btn-color">등록</button>
						<button type="button" class="btn btn-color"
							onclick="history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>