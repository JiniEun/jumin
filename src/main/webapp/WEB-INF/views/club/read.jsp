<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html>
<html>
<head>
<title>조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="utf-8">
<link rel="stylesheet" href="/resources/static/css/club_read.css">
<script type="text/javascript">
	function updateM() {
		var url = "/club/update";
		url += "?clID=${dto.clID}";
		location.href = url;
	}
	function deleteM() {
		var url = "/club/delete";
		url += "?clID=${dto.clID}";
		location.href = url;
	}

	function listM() {
		var url = "/club/list";
		location.href = url;
	}
</script>

</head>
<body>
<article>
        <div class="container" role="main">
            <div class="bg-white rounded shadow-sm">
                <div class="title">
                    <span class="title">${dto.title} </span>
                </div>

                <div class="board_info_box"> 
                    <span class="nickname">
                        ${dto.nickname}
                    </span><span class="date">
                        ${dto.rdate}
                    </span><span class="viewcnt">
                        조회 ${dto.viewcnt}
                    </span>

                </div>

                <div class="content" style="text-align:center;">${dto.content}
                </div>

            </div>
            <!-- reply -->
             
	<form name="replyForm">
	    <section class="reply">
	    	<input type="hidden" name="clID" value="${dto.clID}"/>
	    	<input type="hidden" name="nickname" value="${dto.nickname}"/>
	        <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
	        <button class="rebtn" id="rebtn" name="rebtn">댓글 등록</button>
	    </section>
	
	    <section class="reshow">
	        <div class="replyList"></div>
	    </section>
	
	    <section class="repaging">
	        <span>${paging}</span>
	    </section>
	</form>
            <div>
					<button type="button" class="btn" onclick="location.href='${root}/club/create'">등록</button>
					<button type="button" class="btn" onclick="updateM()">수정</button>
					<button type="button" class="btn" onclick="deleteM()">삭제</button>
					<button type="button" class="btn" onclick="listM()">목록</button>
		</div>
        </div>
    </article>
    <%@ include file="/WEB-INF/views/club/reply.jsp" %>
</body>
</html>