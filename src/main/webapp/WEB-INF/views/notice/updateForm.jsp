<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<h3 class="col-sm-offset-2 col-sm-10">공지사항 수정</h3>
		<br>
		<form class="form-horizontal" action="/notice/create" method="post"
			onsubmit="return checkIn(this)">
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-8">
					<input type="text" name="title" id="title" class="form-control"
						value="제목 수정 전">
				</div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="wname">작성자</label>
				<div class="col-sm-2">
					<input type="text" name="wname" id="wname" class="form-control"
						value="작성자1">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-8">
					<textarea rows="12" cols="7" id="content" name="content"
						class="form-control">내용 수정하기</textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-2">
					<input type="password" name="passwd" id="passwd"
						class="form-control">

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn" style="border-color: #87CEFA; color: #87CEFA;">수정</button>
					<button type="button" class="btn" onclick="history.back()"
						style="border-color: #87CEFA; color: #87CEFA;">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>