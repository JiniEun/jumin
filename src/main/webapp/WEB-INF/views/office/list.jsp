<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/static/css/office.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=92xk29w19e&submodules=geocoder"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=panorama"></script>
    

<script type="text/javascript">

	function updateM(oid) {
		var url = "./admin/office/update";
		url += "?oid="+oid;
		location.href = url;
		}
		function deleteM(oid) {
		var url = "/admin/office/delete";
		url += "?oid="+oid;
		location.href = url;
		}

</script>
	
</head>
<body>
<div class="pagetitle">
        <h2>동네 주요기관 게시판</h2>
        <c:choose>
            <c:when test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
                <button type="button" onclick="location.href='../admin/office/create'">글쓰기</button>
            </c:when>
	    </c:choose>
    </div>
    
    <div class="container">
        <section class="api">
            <button class="street" id="street">거리뷰</button>
            <div class="map" id="map">maparea</div>
            <div class="pano" id="pano">panoarea</div>
        </section>

        <section class="looparea">
            
        <c:forEach var="dto" items="${list}">    
            <div class="loop">
                <div class="imgarea">
                    <img src="/office/storage/${dto.filename}">
                </div>

                <div class="detail">
                    <input type="hidden" name="oid" value="${dto.oid}"/>
                    <div>기관명 : ${dto.oname} </div>
                    <div>주소 : ${dto.address}</div>
                    <div>홈페이지 : ${dto.webaddress}</div>
                    <div>전화번호 : ${dto.phone}</div>
                    <div class="contents">설명 : ${dto.contents}</div>
                    <button class="moreBtn">더보기</button>
                </div>

                <c:choose>
		            <c:when test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
			            <button onclick="updateM('${dto.oid}')">수정</button>
		        		<button onclick="deleteM('${dto.oid}')">삭제</button>
	        		</c:when>
	        	</c:choose>
            </div>
        </c:forEach>

        </section>
    </div>
    
    <%@ include file="map.jsp" %>
</body>
</html>