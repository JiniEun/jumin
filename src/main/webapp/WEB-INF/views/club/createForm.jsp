<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">
</script>
<script type="text/JavaScript">
	$(function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	});

</script>
<style>
.btn-color2 {
	background-color: #5BA6A6;
	color: white;
}
.input-form {
	max-width: 1000px;
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
</style>
</head>
<body>
		<div class="container-fluid">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">동호회 글쓰기</h4>
		<form class="form-horizontal" action="./create" method="post"
			onsubmit="return checkIn(this)" enctype="multipart/form-data">
	          
					<div class="mb-3">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control">
					</div>
					
					<div class="mb-3" hidden>
						<label for="ID">작성자ID</label>
						<p>${ID}</p>
						<input type="hidden" name="ID" id="ID" value="${ID}">
					</div>
					<div class="mb-3" hidden>
						<label for="regionID">지역</label>
						<p>${regionID}</p>
						<input type="hidden" name="regionID" id="regionID" value="${regionID}">
					</div>
					<div class="mb-3">
						<label for="nickname">작성자</label>
						<input type="text" readonly name="nickname" id="nickname" class="form-control" value="${nickname}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea rows="12" cols="7" id="content" name="content"
							class="form-control"></textarea>
					</div>
					<div class="mb-3">
						<label for="fileNameMF">대표 이미지</label>
						<input type="file" rows="12" cols="7" id="fileNameMF" name="fileNameMF"
							class="form-control"></input>
					</div>
					<div class="mb-3" style="margin-top:10px;">
						<button type="submit" class="btn btn-color2">등록</button>
						<button type="button" class="btn btn-color2"
							onclick="history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>