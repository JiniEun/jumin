<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
				<h4 class="mb-3">공지사항 수정</h4>
				<form class="validation-form" novalidate action="/notice/update"
					method="post" name='frm' enctype="multipart/form-data">
					<input type="hidden" id="nID" name="nID" value="${dto.NID }">
					<div class="mb-3">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control" value="${dto.title }">
					</div>
					<div class="mb-3">
						<label for="ID">작성자</label>
						<p>${dto.ID}</p>
						<input type="hidden" name="ID" id="ID" value="${dto.ID}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea rows="12" cols="7" id="content" name="content"
							class="form-control">${dto.content }</textarea>
					</div>
					<div class="row">
						<div class="col-md-2">
							<label for="password">비밀번호</label>
						</div>
						<div class="col-md-4">
							<input type="password" name="password" id="password"
								class="form-control">
						</div>
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