<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/static/css/market.css">
<title>Insert title here</title>
<script>


	function popup(){
	    var url = "./uploadfile";
	    var name = "popup test";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
		<h3 class="col-sm-offset-2 col-sm-10">마켓 수정</h3>
		<br>
		
		
		<form class="form-horizontal" action="/market/update" method="post" enctype="multipart/form-data">
		 	   <input type="hidden" name="mid" id="mid" class="form-control" value="${dto.mid}">
	    	   <input type="hidden" name="id" id="id" class="form-control" value="${dto.id}">
	    	   <input type="hidden" name="id" id="id" class="form-control" value="${dto.category}">

				 
			    
<!-- 		    <div class="form-group"> -->
<!-- 			      <label class="control-label col-sm-2" for="filenameMF">변경파일</label> -->
<!-- 			      <div class="col-sm-6">           -->
<!-- 			        <input type="file" class="form-control" id="filenameMF"  -->
<!-- 			        name="filenameMF" accept=".jpg,.png,.gif" > -->
<!-- 			      </div> -->
<!-- 		    </div> -->
		 <label class="control-label col-sm-2" for="filenameMF">상품이미지</label>
    		<div class="col-sm-8" id="pop">
				<div>
					<input type="button" class="imgbutton" value="이미지 수정" onclick="popup()"><br>
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
					<button class="btn" >수정</button>
					<button type="button" class="btn" onclick="history.back()">취소</button>
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>