<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/> 
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html>
<html>
<head>
<title>조회</title>
<meta charset="utf-8">
 
<script type="text/javascript">

		   
	
	function updateC() {
		var url = "/community/update";
		url += "?cid=${dto.cid}";
		location.href = url;
	}
	
</script>
 
</head>
<body>
        <div class="container">
 
                <h2>community</h2>
                           
            <div class="card card-default">
            <div class="card-header" style="font-size:20px;">${dto.title}</div>
          
            <div class="card-body">
                <h5 class="card-title">작성자</h5>
                <p class="card-text">${dto.nickname}</p>
            </div>

           
            <div class="card-body">
                <h5 class="card-title">내용</h5>
                <p class="card-text">${dto.content}</p>
            </div>

            <div class="card-body">
                <h5 class="card-title">등록일</h5>
                <p class="card-text">${dto.rdate}</p>
            </div>

           
            <div class="card-body">
                <h5 class="card-title">조회수</h5>
                <p class="card-text">${dto.viewcnt}</p>
            </div>
        </div>
        <br>
        <div>
            
            <button type="button" class="btn btn-color" onclick="updateC()">수정</button>
            <button type="button" class="btn btn-color">삭제</button>
            <button type="button" class="btn btn-color" onclick="location.href='${root}/community/list'">목록</button>
        </div>
         </div>
</body>
</html>