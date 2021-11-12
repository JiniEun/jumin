<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>동호회 페이지</title>
  <meta charset="utf-8">
</head>

<body> 
<div class="container">

<h3> 우리 동네 동호회 </h3>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="nickname"
        <c:if test= "${col=='nickname'}"> selected </c:if>
        >성명</option>
        <option value="title"
        <c:if test= "${col=='title'}"> selected </c:if>
        >제목</option>
        <option value="content"
        <c:if test= "${col=='content'}"> selected </c:if>
        >내용</option>
        <option value="title_content"
        <c:if test= "${col=='title_content'}"> selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
				<button type="submit" class="btn btn-default" >검색</button>
				<button type="button" class="btn btn-default" onclick="location.href='${root}/club/create'">등록</button>
  </form>
  
<c:choose>   
<c:when test="${empty list}">
   <div class="row">
   <h5>아직 등록된 글이 없습니다.</h5> 
   </div>
</c:when>
<c:otherwise>
<c:set var="list" value="${list}"/>
<div class="row">
    <c:forEach var="dto" begin="0" end="3" items="${list}">
    <div class="col-sm-3">
      <a href="/club/read/${dto.clID}">
       <p><img src="/pstorage/${dto.fileName}" class="img-thumbnail"  width="236" height="306"></p></a>
        <p>${dto.title}<br><b>${dto.nickname}</b></p>
    </div>
    </c:forEach>
</div>
 <div class="row">
    <c:forEach var="dto" begin="4" end="7" items="${list}">
    <div class="col-sm-3">
      <a href="/club/read/${dto.clID}">
       <p><img src="/pstorage/${dto.fileName}" class="img-thumbnail"  width="236" height="306"></p></a>
        <p>${dto.title}<br><b>${dto.nickname}</b></p>
    </div>
    </div>
    </c:forEach>
</div>
  ${paging}
</c:otherwise>
</c:choose>
</div>
</body> 
</html> 