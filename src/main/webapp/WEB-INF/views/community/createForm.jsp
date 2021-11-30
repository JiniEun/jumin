<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/static/css/market.css">
<title>Insert title here</title>
<script type="text/JavaScript">
 

 function checkIn(f){
     if (f.title.value == ""){
             alert("제목을 입력하세요");
             f.title.focus()
             return false;
     }
     
     if (f.content.value == '') {
         alert('내용을 입력해 주세요.');
         f.content.focus();
         return false;
     }
     
}
 </script>
</head>
<body>
<div class="container-fluid">
        <h3 class="col-sm-offset-2 col-sm-10">community 생성</h3>
        <br>
        <form class="form-horizontal" action="/community/create" method="post" enctype="multipart/form-data" onsubmit="return checkIn(this)">
        
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
	         <div class="form-group">
                <div class="col-sm-8">
                    <input type="hidden" name="id" id="id" class="form-control" value="${ID}">
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="title">닉네임</label>
                <div class="col-sm-8">
                     <input type="text" name="nickname" id="nickname" class="form-control" value="${nickname}">
                </div>

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
                <div class="col-sm-offset-2 col-sm-5">
                    <button class="btn btn-color">등록</button>
                    <button type="button" class="btn btn-color" onclick="history.back()">취소</button>
            </div>
           </div>
        </form>
    </div>
</body>
</html>