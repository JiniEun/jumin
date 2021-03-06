<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 생성</title>
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
				<h4 class="mb-3">동네친구 등록</h4>
		<form class="form-horizontal" action="./create" method="post"
			onsubmit="return checkIn(this)" enctype="multipart/form-data">
					
					<div class="form-group">
	            <label for="category">카테고리</label>
	            <div class="mb-3">
	              <select class="form-control" name="category" id="category">
	                <option value="식사">식사</option>
	                <option value="산책">산책</option>
	                <option value="취미">취미</option>
	                <option value="여가">여가</option>
	                <option value="기타">기타</option>
	              </select>
	            </div>
	          </div>
					<div class="mb-3" hidden>
						<label for="ID">작성자ID</label>
						<p>${userID}</p>
						<input type="hidden" name="userID" id="userID" value="${userID}">
					</div>
					<div class="mb-3" hidden>
						<label for="regionID">지역</label>
						<p>${regionID}</p>
						<input type="hidden" name="regionID" id="regionID" value="${regionID}">
					</div>
					<div class="mb-3">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control">
					</div>
					<div class="mb-3">
						<label for="nickname">작성자</label>
						<input type="text" readonly name="nickname" id="nickname" class="form-control" value="${nickname}">
					</div>
										<div class="mb-3">
						<label for="age">나이</label>
						<input type="text" readonly name="age" id="age" class="form-control" value="${age}">
					</div>
					<div class="mb-3" hidden>
						<label for="gender">성별</label>
						<input type="text" readonly name="gender" id="gender" class="form-control" value="${gender}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea rows="12" cols="7" id="content" name="content"
							class="form-control"></textarea>
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