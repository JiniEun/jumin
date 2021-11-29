<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
    <script type="text/JavaScript">
	 $(function() {
         CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
 	  });
 </script>
</head>
<body>
<div class="container">
<h5 class="col-sm-offset-2 col-sm-10">동네모임-동호회 게시글 작성</h5>
<form class="form-horizontal" 
      action="./create"
      method="post"
      onsubmit="return checkIn(this)"
      enctype="multipart/form-data"
      >
  <div class="form-group" hidden>
    <label class="control-label col-sm-2" for="id">작성자ID</label>
    <div class="col-sm-6">
      <input type="text" readonly name="ID" id="ID" class="form-control" value="${ID}">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="regionID">지역</label>
    <div class="col-sm-6">
      <input type="text" readonly name="regionID" id="regionID" class="form-control" value="${regionID}">
    </div>
  </div>
  
  <div class="form-group">
                <label class="control-label col-sm-2" for="writer">작성자</label>
                <div class="col-sm-6">
                    <input type="text" readonly name="nickname" id="nickname" class="form-control" value="${nickname}">
                </div>
            </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="fileNameMF">대표 이미지</label>
    <div class="col-sm-6">
      <input type="file" name="fileNameMF" id="fileNameMF" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="password">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="password" id="password" class="form-control">
    </div>
  </div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body>
</html>