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
    
    
    <title>동네스팟 조회</title>
</head>
<body>
<div class="container">   

    <section class="slide">
        <div class="arw"><a href=""><i class="fas fa-caret-left"></i></a></div>
        <div class="images">
            <img src="/tour/storage/${dto.filename}">
        </div>
        <div class="arw"><a href=""><i class="fas fa-caret-right"></i></a></div>
    </section>


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
	        <div id="rc">{dto.content}</div>
	        <div class="replyList"></div>
	    </section>
	
	    <section class="repaging">
	        <span>{paging}</span>
	    </section>
	</form>
	
	    <section class="btn">
	        <button>목록</button>
	        <button>수정</button>
	        <button>삭제</button>
	    </section>
	
</div>



<%@ include file="reply.jsp" %>

</body>
</html>