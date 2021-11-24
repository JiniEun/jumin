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
<script type="text/javascript">
	function updateM() {
		var url = "/fboard/update";
		url += "?fbID=${dto.fbID}";
		location.href = url;
	}
	function deleteM() {
		var url = "/fboard/delete";
		url += "?fbID=${dto.fbID}";
		location.href = url;
	}

	function listM() {
		var url = "/fboard/list";
		location.href = url;
	}
</script>
  <style>
  .btn-color {
	background-color: #5BA6A6;
	color: white;
}
  </style>
</head>
<body>
<div class="container col-md-6">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-3">[${dto.category}] ${dto.title}</h4>
            <h6 class="card-subtitle text-muted mb-4">
            	<div hidden>
            	<i class="far fa-user"></i> ${dto.userID}
            	</div>
                <i class="far fa-user"></i> ${dto.nickname}
                
                <i class="far fa-clock"></i> ${dto.rdate}
                
                <i class="fas fa-align-justify"></i> 조회 ${dto.viewcnt}
            </h6>
            <p class="card-text">${dto.content}</p>
        </div>
        <div class="card-body">
		 <c:choose>
			<c:when test="${sessionScope.ID==dto.userID}">
				<button type="button" class="btn btn-color" onclick="updateM()">수정</button>
				<button type="button" class="btn btn-color" onclick="deleteM()">삭제</button>
				<button type="button" class="btn btn-color" onclick="listM()">목록</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-color" onclick="">신청</button>
				<button type="button" class="btn btn-color" onclick="listM()">목록</button>
			</c:otherwise>
		 </c:choose>
        </div>
    </div>
</div>
<!-- reply 추가할 지 고민 -->
</body>
</html>