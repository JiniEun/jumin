<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>	
    <link rel="stylesheet" href="/resources/static/css/market.css">
    <meta charset="UTF-8">
    <title>상세페이지</title>    
    <script type="text/javascript">
    function updateM() {
		var url = "/market/update";
		url += "?mid=${dto.mid}";
		location.href = url;
	}
		

</script>
    
    <title>동네장터 조회</title>
</head>
<body>
<div class="container">   

<h2 class="col-12 text-center tm-section-title"></h2>


<div class="section">
        
			<input type="radio" name="slide" id="slide01" checked>
       	 	<input type="radio" name="slide" id="slide02" >
        	<input type="radio" name="slide" id="slide03" >
        
        <div class="slidewrap">
          <ul class="slidelist">
            <li>
              <a>
                <label for="slide03" class="left"></label>
                <img src="/market/storage/${dto.filename }" width="500px" height="500px">
                <label for="slide02" class="right"></label>
              </a>
            </li>
            <li>
              <a>
                <label for="slide01" class="left"></label>
                <img src="/market/storage/${dto.filename }" width="500px" height="500px">
                <label for="slide03" class="right"></label>
              </a>
            </li>
            <li>
              <a>
                <label for="slide02" class="left"></label>
                <img src="/market/storage/${dto.filename }" width="500px" height="500px">
                <label for="slide01" class="right"></label>
              </a>
            </li>
                           
          </ul>
     
          <div class="slide-control">
            <div class="control01">
              <label for="slide03" class="left"></label>
              <label for="slide02" class="right"></label>
            </div>
            <div class="control02">
              <label for="slide01" class="left"></label>
              <label for="slide03" class="right"></label>
            </div>
            <div class="control03">
              <label for="slide02" class="left"></label>
              <label for="slide01" class="right"></label>
            </div>
          </div>
         	
         	<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
			</ul>
         	
          </div>
          	
        	
      </div>


 <div class="card card-default">
            <div class="card-header" style="font-size:20px;">${dto.title}</div>
    <div class="card-body">
        <p class="card-text">${dto.content}</p>
    </div>
    <div class="card-body">
    			
                <p class="card-text">작성자 : ${dto.nickname}</p>
                <p class="card-text">조회수 : ${dto.viewcnt}</p>
                <p class="card-text">등록일자 : ${dto.rdate}</p>
        
        
    </div>

    
<br>
        <div>
            
            <button type="button" class="btn btn-color" onclick="updateM()">수정</button>
            <button type="button" class="btn btn-color">삭제</button>
            <button type="button" class="btn btn-color" onclick="location.href='${root}/market/list'">목록</button>
        </div>

	
	
</div>


</div>

</body>
</html>