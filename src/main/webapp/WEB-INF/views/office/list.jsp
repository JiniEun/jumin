<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Document</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/static/css/office.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=92xk29w19e"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=92xk29w19e&submodules=geocoder"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=92xk29w19e&submodules=panorama"></script>
<script type="text/javascript">

	function updateM(oid) {
		var url = "/admin/office/update";
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

	<div class="pb-4">
		<div class="pagetitle">
			<h2 style="margin: 20px 0; text-align: center;">동네 주요시설</h2>
			<p class="col-12 text-center">우리 지역의 공공기관, 인프라를 한눈에!</p>
			<br>
			<c:choose>
				<c:when
					test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
					<button type="button"
						onclick="location.href='../admin/office/create'">글쓰기</button>
				</c:when>
			</c:choose>

			<form class="search-form" action="/office/list">

				<select class="form-control" name="districtcode"
					style="width: 200px; height: 40px;">
					<option value="${mydistrictcode}">현위치</option>
					<option value="1" <c:if test="${districtcode==1}"> selected</c:if>>서울</option>
					<option value="2" <c:if test="${districtcode==2}"> selected</c:if>>부산</option>
					<option value="3" <c:if test="${districtcode==3}"> selected</c:if>>대구</option>
					<option value="4" <c:if test="${districtcode==4}"> selected</c:if>>인천</option>
					<option value="5" <c:if test="${districtcode==5}"> selected</c:if>>광주</option>
					<option value="6" <c:if test="${districtcode==6}"> selected</c:if>>대전</option>
					<option value="7" <c:if test="${districtcode==7}"> selected</c:if>>울산</option>
					<option value="8" <c:if test="${districtcode==8}"> selected</c:if>>세종</option>
					<option value="9" <c:if test="${districtcode==9}"> selected</c:if>>경기</option>
					<option value="10"
						<c:if test="${districtcode==10}"> selected</c:if>>강원</option>
					<option value="11"
						<c:if test="${districtcode==11}"> selected</c:if>>충북</option>
					<option value="12"
						<c:if test="${districtcode==12}"> selected</c:if>>충남</option>
					<option value="13"
						<c:if test="${districtcode==13}"> selected</c:if>>전북</option>
					<option value="14"
						<c:if test="${districtcode==14}"> selected</c:if>>전남</option>
					<option value="15"
						<c:if test="${districtcode==15}"> selected</c:if>>경북</option>
					<option value="16"
						<c:if test="${districtcode==16}"> selected</c:if>>경남</option>
					<option value="17"
						<c:if test="${districtcode==17}"> selected</c:if>>제주</option>
				</select>
				<button class="moreBtn" type="submit">검색</button>

			</form>
		</div>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="6">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>

				<div class="container l-container">
					<section class="api">
						<button class="street moreBtn" id="street">거리뷰</button>
						<div class="map" id="map">maparea</div>
						<div class="pano" id="pano">panoarea</div>
					</section>

					<section class="looparea">

						<c:forEach var="dto" items="${list}">
							<div class="loop">
								<div class="imgarea" id="imgarea${dto.oname}">
									<img class="l-img" src="/office/storage/${dto.filename}">
									<!--  <img src="/resources/static/images/office/${dto.filename}"> -->
								</div>

								<div class="detail" id="detail${dto.oid}">

									<div>▶ 기관명 : ${dto.oname}</div>
									<div>▶ 주소 : ${dto.address}</div>
									<div>
										<a href="${dto.webaddress}" target="_blank">▶ 홈페이지 :
											${dto.webaddress}</a>
									</div>
									<div>▶ 전화번호 : ${dto.phone}</div>

									<input type="hidden" id="oid" name="oid" value="${dto.oid}" />
									<button class="moreBtn" onclick="popup(${dto.oid})">로드맵</button>
								</div>

								<c:choose>
									<c:when
										test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
										<button class="moreBtn" onclick="updateM('${dto.oid}')">수정</button>
										<button class="moreBtn" onclick="deleteM('${dto.oid}')">삭제</button>
									</c:when>
								</c:choose>

							</div>
						</c:forEach>

					</section>
				</div>
			</c:otherwise>
		</c:choose>

		<%@ include file="map.jsp"%>
	</div>
</body>
</html>