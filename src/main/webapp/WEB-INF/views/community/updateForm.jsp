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
		<h3 class="col-sm-offset-2 col-sm-10">community 수정</h3>
		<br>
		<form class="form-horizontal" action="/community/update" method="post">
			<input type="hidden" name="cid" id="cid" class="form-control"
						value="${dto.cid}">
			 <div class="form-group">
	            <label class="control-label col-sm-2" for="category">카테고리</label>
	            <div class="col-sm-6">
	              <select class="form-control" name="category" id="category">
	                <option value="동네">동네이야기</option>
	                <option value="분실물">분실물</option>
	              </select>
	            </div>
	          </div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-8">
					<input type="text" name="title" id="title" class="form-control"
						value="${dto.title}">
				</div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="nickname">작성자</label>
				<div class="col-sm-2">
					<input type="text" name="nickname" id="nickname" class="form-control"
						value="${dto.nickname}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-8">
					<textarea rows="12" cols="7" id="content" name="content"
						class="form-control">${dto.content}</textarea>
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