<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/static/css/tour_list.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <title>Image Gallery</title>
  <script type="text/javascript">
 	function read(tid){
       var url = "read";
       url += "?tid="+tid;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
  }
   </script>
  
</head>
<body>


  <section class=mtitle>
    <h1>동네스팟</h1>
  
  <!-- 검색 -->
  <form class="search-form" action="/tour/list">  
    <section class="search">
        <select class="form-control" name="col">
          <option value="title"
          <c:if test="${col=='title'}"> selected</c:if>
          >제목</option>

          <option value="writer"
          <c:if test="${col=='writer'}"> selected</c:if>
          >글쓴이</option>

          <option value="total"
          <c:if test="${col=='total'}"> selected</c:if>
          >전체</option>
        </select>

        <input type="text" class="form-control" placeholder="Search . . ." name="word" value="${word}">
        <button type="submit">검색</button>
        <button type="button" onclick="location.href='../tour/create'">글쓰기</button>
    </section>
  </form>
  
  </section>
  		<script>
	  		filename=${dto.filename}
	    	filename.split(",");
	    	console.log(filename);
  		</script>
  			
  
  
  <div class="container">
    <div class="images">
    <div class="imageFlex1">
    <c:choose>
    	<c:when test="${empty list}">
    		<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
    	</c:when>
    <c:otherwise>
    
    	<c:forEach var="dto" items="${list}" begin="0" step="3">
	        <img src="/tour/storage/${fn:split(dto.filename,',')[0]}" alt="iuhello.jpg"> 
	        <section class=title>
	          <a href="javascript:read('${dto.tid}')"><i class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a>
	          <span id="score">  	
			        <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
			        <c:if test="${dto.score=='2'}">★★☆☆☆</c:if>
			        <c:if test="${dto.score=='3'}">★★★☆☆</c:if>
			        <c:if test="${dto.score=='4'}">★★★★☆</c:if>
			        <c:if test="${dto.score=='5'}">★★★★★</c:if>
			</span>
	        </section>
	        <section class=info>
	          <span style="width:100;overflow:hidden;">글쓴이 : ${dto.nickname}</span><br>
	          <span>Date : ${dto.rdate.substring(0,10)}</span>
	        </section>
        </c:forEach>
     
    </c:otherwise>
    </c:choose>
    
      </div>
    </div>
    
    <div class="images">
      <div class="imageFlex2">
		<c:choose>
    	<c:when test="${empty list}">
    		<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
    	</c:when>
    	<c:otherwise>
    
    	<c:forEach var="dto" items="${list}" begin="1" step="3">
	        <img src="/tour/storage/${fn:split(dto.filename,',')[0]}" alt="iuhello.jpg"> 
	        <section class=title>
	          <a href="javascript:read('${dto.tid}')"><i class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a>
	          <span id="score">  	
			        <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
			        <c:if test="${dto.score=='2'}">★★☆☆☆</c:if>
			        <c:if test="${dto.score=='3'}">★★★☆☆</c:if>
			        <c:if test="${dto.score=='4'}">★★★★☆</c:if>
			        <c:if test="${dto.score=='5'}">★★★★★</c:if>
			</span>
	        </section>
	        <section class=info>
	          <span style="width:100;overflow:hidden;">글쓴이 : ${dto.nickname}</span>
	          <span>Date : ${dto.rdate.substring(0,10)}</span>
	        </section>
        </c:forEach>
    </c:otherwise>
    </c:choose>
        
      </div>
    </div>
    
    <div class="images">
      <div class="imageFlex3">
		<c:choose>
    	<c:when test="${empty list}">
    		<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
    	</c:when>
    <c:otherwise>
    
    	<c:forEach var="dto" items="${list}" begin="2" step="3">
	        <img src="/tour/storage/${fn:split(dto.filename,',')[0]}" alt="iuhello.jpg"> 
	        <section class=title>	
	          <a href="javascript:read('${dto.tid}')"><i class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a>
	          <span id="score">  	
			        <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
			        <c:if test="${dto.score=='2'}">★★☆☆☆</c:if>
			        <c:if test="${dto.score=='3'}">★★★☆☆</c:if>
			        <c:if test="${dto.score=='4'}">★★★★☆</c:if>
			        <c:if test="${dto.score=='5'}">★★★★★</c:if>
			</span>
	        </section>
	        <section class=info>
	          <span style="width:100;overflow:hidden;">글쓴이 : ${dto.nickname}</span>
	          <span>Date : ${dto.rdate.substring(0,10)}</span>
	        </section>
        </c:forEach>
     
    </c:otherwise>
    </c:choose>
        
      </div>
    </div>
  
  <div class="paging">${paging}</div>
  
  </div>

</body>
</html>