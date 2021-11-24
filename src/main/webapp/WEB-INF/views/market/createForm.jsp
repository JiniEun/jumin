<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head>
  <link rel="stylesheet" href="/resources/static/css/market.css">
  <title>dongneMarket</title>
  <meta charset="utf-8">
  <script type="text/JavaScript">

  
  function popup(){
      var url = "./uploadfile";
      var name = "popup test";
      var option = "width = 500, height = 500, top = 100, left = 200, location = no"
      window.open(url, name, option);
  }

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
     
     if (f.fileName.value == ""){
             alert("상품이미지를 선택하세요");
             f.fileName.focus();
             return false;
     }
}
 </script>
</head>
<body> 

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">상품 등록</h1>
<form class="form-horizontal" 
      action="/market/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">

 	
          <div class="form-group">
            <label class="control-label col-sm-2" for="cateno">상품분류</label>
            <div class="col-sm-6">
              <select class="form-control" name="category" id="category">
                <option value="1">가구</option>
                <option value="2">전자</option>
                <option value="3">의류</option>
                <option value="4">기타</option>
              </select>
            </div>
          </div>
    <div class="form-group">
    
    <div class="col-sm-6">
      <input type="hidden" name="id" id="id" class="form-control" value="${ID}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="nickname">닉네임</label>
    <div class="col-sm-6">
      <input type="text" name="nickname" id="nickname" class="form-control" value="${nickname}">
    </div>
  </div>
  	<div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="price">가격</label>
    <div class="col-sm-8">
      <input type="text" name="price" id="price" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">상세정보</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  
  
    <label class="control-label col-sm-2" for="filenameMF">상품이미지</label>
    <div class="col-sm-8" id="pop">
				<div>
					<input type="button" class="imgbutton" value="이미지 추가"  onclick="popup()"><br>
				</div>
	</div>
 <br>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn" >등록</button>
    <button type="reset" class="btn"  onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 