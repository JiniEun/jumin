<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
        <h2 class="col-sm-offset-2 col-sm-10">글 수정</h2>
        <form class="form-horizontal" 
        	action="/tour/update" 
        	method="post" 
        	enctype="multipart/form-data"
        	onsubmit="return checkIn(this)">
    		
    		<input type="hidden" name="tid" id="tid" class="form-control" value="${dto.tid}">
            <div class="form-group">
                <label class="control-label col-sm-2" for="writer">작성자</label>
                <div class="col-sm-6">
                    <input type="text" name="writer" id="writer" class="form-control" value="${dto.writer}" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="title">제목</label>
                <div class="col-sm-8">
                    <input type="text" name="title" id="title" class="form-control" value="${dto.title}">
                </div>
            </div>
    
            <div class="form-group">
                <label class="control-label col-sm-2" for="contents">내용</label>
                <div class="col-sm-8">
                    <textarea rows="12" cols="7" id="contents" name="contents" class="form-control">${dto.contents}</textarea>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="score">점수</label>
                <div class="col-sm-8">
                    <input type="text" name="score" id="score" class="form-control" value="${dto.score}">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="filenameMF">파일</label>
                <div class="col-sm-6">
                    <input multiple="multiple" type="file" name="filenameMF" id="filenameMF" class="form-control">
                </div>
            </div>

            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5">
                    <button class="btn btn-default">등록</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
                </div>
            </div>
        </form>
    </div>
   
  <div class="container">
  <h2>파일업로드</h2>
  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
  	
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	
  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>첨부 파일</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div>
  	<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
  </form>
</div>

<%@ include file="uploadfile.jsp" %>
    
</body>
</html>