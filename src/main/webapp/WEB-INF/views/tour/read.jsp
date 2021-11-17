<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="src/main/resources/statoc/css/tour_read.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/static/css/tour_read.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style> .carousel-inner > .carousel-item > img{ width: 1080px; height: 720px;} </style>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
	<script> $('.carousel').carousel({interval: 2000}) </script>


    <script type="text/javascript">
	function updateM() {
		var url = "/tour/update";
		url += "?tid=${dto.tid}";
		location.href = url;
	}
	function deleteM() {
		var url = "/tour/delete";
		url += "?tid=${dto.tid}";
		location.href = url;
	}
	//${fn:split(dto.filename,',')[0]}
</script>
    
    <title>동네스팟 조회</title>
</head>
<body>
<div class="container">   
	<!-- Slide -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
		<!-- 슬라이드쇼 -->
			<div class="carousel-item active">
				<!-- 가로 -->
				<img class="d-block w-100" src="/tour/storage/${fn:split(dto.filename,',')[1]}" alt="First Slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>TEST</h5>
					<p>testtest</p>
				</div>
			</div>
		<script>
		console.log('${dto.filename}');
		</script>
		
		<c:forEach var="dto" items="${dto.filename}" varStatus="status">
			<div class="carousel-item">
				<c:forEach var="filename" items="${fn:split(dto,',')}">
					<img src="/tour/storage/${filename}"  alt="iuhello.jpg">
				</c:forEach>
			</div>
		</c:forEach>	
	
			
		</div>
		
	<!-- 버튼 -->	
	<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span></a> 
		 <a class="carousel-control-next" href="#demo" data-slide="next"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span></a> 
		  <ul class="carousel-indicators">
			  
			  <li data-target="#demo" data-slide-to="0" class="active"></li> 
			
			  <c:forEach var="dto" items="${dto.filename}" varStatus="status">
			  	<li data-target="#demo" data-slide-to="${status.count}"></li>
			  </c:forEach>	
			  
		  </ul>
	</div>
    
    <!-- 내용 -->
	<section class="title">
        <div>${dto.title}</div>
    </section>

    <section class="info">
        <span class="writer">writer : ${dto.writer}</span>
        <span class="score">score : ${dto.score}</span>
        <span class="date">date : ${dto.rdate}</span>
    </section>

    <section class="contents">
        <article>${dto.contents}</article>
    </section>

	<!-- reply -->
	<form name="replyForm">
	    <section class="reply">
	    	<input type="hidden" name="tid" value="${dto.tid}"/>
	        <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
	        <button class="rebtn" id="rebtn" name="rebtn">댓글 등록</button>
	    </section>
	
	    <section class="reshow">
	        <div class="replyList"></div>
	    </section>
	
	    <section class="repaging">
	        <span>{paging}</span>
	    </section>
	</form>
	
	    <section class="btn">
	        <button>목록</button>
	        <button onclick="updateM()">수정</button>
	        <button onclick="deleteM()">삭제</button>
	    </section>
	
</div>



<%@ include file="reply.jsp" %>

</body>
</html>