<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/resources/static/css/tour_create.css">
  <title>통네스팟 게시판 글쓰기</title>
<script>
        function popup(){
            var url = "./uploadfile";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
<script type="text/JavaScript">
        
 	function checkIn(f){
         if (f.title.value == ""){
              alert("제목를 입력하세요");
              f.title.focus();
              return false;
         }
         if (f.contents.value == '') {
             window.alert('내용을 입력해 주세요.');
             f.contents.focus();
             return false;
         }
         if (f.score.value == ""){
             alert("평점을 입력해주세요");
             f.score.focus();
             return false;
         }
         if (f.inputfile.value == ""){
             alert("평점을 입력해주세요");
             f.score.focus();
             return false;
         }
 }
 </script>    

</head>
<body>
    <div class="container">
        <h2 class="col-sm-offset-2 col-sm-10">동네스팟 생성</h2>
        <form class="form-horizontal" 
        	action="/tour/create" 
        	method="post" 
        	enctype="multipart/form-data"
        	onsubmit="return checkIn(this)">
    		
            <div class="form-group">
                <label class="control-label col-sm-2" for="writer">작성자</label>
                <div class="col-sm-6">
                	<input type="hidden" readonly name="writer" id="writer" class="form-control" value="${writer}">
                    <input type="text" readonly name="nickname" id="nickname" class="form-control" value="${nickname}">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="districtcode">지역</label>
                <select class="districtcode" name="districtcode">
					
				  <option value='' selected>-- 선택 --</option>
				  <option value="1">서울</option>
				  <option value="2">부산</option>
				  <option value="3">대구</option>
				  <option value="4">인천</option>
				  <option value="5">광주</option>
				  <option value="6">대전</option>
				  <option value="7">울산</option>
				  <option value="8">세종</option>
				  <option value="9">경기</option>
				  <option value="10">강원</option>
				  <option value="11">충북</option>
				  <option value="12">충남</option>
				  <option value="13">전북</option>
				  <option value="14">전남</option>
				  <option value="15">경북</option>
				  <option value="16">경남</option>
				  <option value="17">제주</option>
				  
			</select>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="title">제목</label>
                <div class="col-sm-8">
                    <input type="text" name="title" id="title" class="form-control">
                </div>
            </div>
    
            <div class="form-group">
                <label class="control-label col-sm-2" for="contents">내용</label>
                <div class="col-sm-8">
                    <textarea rows="12" cols="7" id="contents" name="contents" class="form-control"></textarea>
                </div>
            </div>
			
			<div id="pop">
				<div>
					<input type="button" value="이미지 추가" onclick="popup()"><br>
				</div>
			</div>

            <div class="score-group">
               <label class="control-label col-sm-2" for="score">평점을 주세요!</label>
                <select class="score" name='score'>
					
				  <option value='' selected>-- 선택 --</option>
				  <option value="1"
		          <c:if test="${score=='★☆☆☆☆'}"> selected</c:if>
		          >★☆☆☆☆</option>
				  <option value="2"
		          <c:if test="${score=='★★☆☆☆'}"> selected</c:if>
		          >★★☆☆☆</option>
		          <option value="3"
		          <c:if test="${score=='★★★☆☆'}"> selected</c:if>
		          >★★★☆☆</option>
		          <option value="4"
		          <c:if test="${score=='★★★★☆'}"> selected</c:if>
		          >★★★★☆</option>
		          <option value="5"
		          <c:if test="${score=='★★★★★'}"> selected</c:if>
		          >★★★★★</option>
			</select>
           
           <div class="btn-group">
                <div class="btn">
                    <button class="btn btn-default">등록</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
                </div>
            </div>
           
           </div>

        </form>

        
    </div>
   
</body>
</html>