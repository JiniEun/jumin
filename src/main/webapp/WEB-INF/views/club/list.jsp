<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html> 
<html> 
<head>
  <title>동호회 페이지</title>
  <meta charset="utf-8">
  <style>
#form {
	padding: 2em 0 2em 0;
}

#top {
	padding: 2em 0 1em 0;
}
.btn-color1 {
	border-color: #5BA6A6; 
	color: #5BA6A6;
}
.btn-color2 {
	background-color: #5BA6A6;
	color: white;
}
</style>
</head>

<body> 
<div id="features-wrapper">
		<div class="container">
			<div id="top">
				<h2 class="col-12 text-center tm-section-title">우리 동네 동호회</h2>
				<p class="col-12 text-center">
					우리 동네 동호회를 소개하고 소식을 공유해보세요! <br> <br>
					<c:if
				test="${not empty sessionScope.ID}">
				<button type="button" class="btn btn-color1"
					onclick="location.href='../club/create'">글 등록하기</button>
			</c:if>
				</p>
			</div>
			
 <form class="form-inline" action="list">
			<div class="form-group">
				<select class="form-control" name="col" style="margin-right: 10px;">
					<option value="total"
						<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
					<option value="title"
						<c:if test= "${col=='title'}"> selected </c:if>>제목</option>
					<option value="content"
						<c:if test= "${col=='content'}"> selected </c:if>>내용</option>
					<option value="title_content"
						<c:if test= "${col=='title_content'}"> selected</c:if>>제목+내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					name="word" style="margin-right: 10px;" value="${word}">
			</div>
			<button type="submit" class="btn btn-color2"
				style="margin-right: 10px;">검색</button>
				</form><br>
  
<c:choose>   
<c:when test="${empty list}">
   <div class="row">
   <tr><td colspan="6">등록된 글이 없습니다.</td></tr>
   </div>
</c:when>

<c:otherwise>
<c:set var="list" value="${list}"/>
	<div class="row">
    	<c:forEach var="dto" begin="0" end="3" items="${list}">
    		<div class="col-sm-3">
    		  <a href="/club/read/${dto.clID}">
      			 <p><img src="/club/${dto.fileName}" class="img-thumbnail"  width="236" height="306"></p></a>
        		 <p><b>${dto.title}</b><br>${dto.nickname}</p>
    		</div>
    	</c:forEach>
	</div>
 	<div class="row">
    	<c:forEach var="dto" begin="4" end="7" items="${list}">
    		<div class="col-sm-3">
      		  <a href="/club/read/${dto.clID}">
       			<p><img src="/club/${dto.fileName}" class="img-thumbnail"  width="236" height="306"></p></a>
        		<p><b>${dto.title}</b><br>${dto.nickname}</p>
    		</div>
    	</c:forEach>
    </div>
      ${paging}
</c:otherwise>
</c:choose>
</div>
</div>
</body> 
</html> 