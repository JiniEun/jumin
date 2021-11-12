<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>수정</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
   <script type="text/JavaScript">
	 $(function() {
         CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
 	  });
   </script>
</head>
<body> 
 
<div class="container">
<h5 class="col-sm-offset-2 col-sm-10">동네모임-동호회 게시글 수정</h5>
<form class="form-horizontal" 
      action="./update"
      method="post"
      >
<input type="hidden" name="clID" value="${dto.clID}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="nickname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="nickname" id="nickname" 
      class="form-control" value="${dto.nickname}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" 
      class="form-control" value="${dto.title}">
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
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 