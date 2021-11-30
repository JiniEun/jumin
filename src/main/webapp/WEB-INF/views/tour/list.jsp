<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/static/css/tour_list.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Image Gallery</title>
<script type="text/javascript">
	function read(tid) {
		var url = "read";
		url += "?tid=" + tid;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>

</head>
<body>
	<h2 style="margin: 5px; text-align : center;">동네스팟</h2>
	<p class="col-12 text-center"> 우리 지역의 여행지와 맛집을 찾아보세요 </p> <br>
	<section class=mtitle>
		

		<!-- 검색 -->
		<form class="search-form" action="/tour/list">
			<section class="search">
				<select class="form-control" name="districtcode">
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

				</select> <select class="form-control" name="col">
					<option value="title" <c:if test="${col=='title'}"> selected</c:if>>제목</option>

					<option value="writer"
						<c:if test="${col=='writer'}"> selected</c:if>>글쓴이</option>

					<option value="total" <c:if test="${col=='total'}"> selected</c:if>>전체</option>

				</select> <input style="width: 200px; height: 40px;" type="text"
					class="form-control" placeholder="검색" name="word" value="${word}">


				<button type="submit">검색</button>
				<button type="button" onclick="location.href='../tour/create'">글쓰기</button>
			</section>
		</form>

	</section>

	<div class="container">
		<div class="images">
			<div class="imageFlex1">
				<c:choose>
					<c:when test="${empty list}">
						<div>등록된 글이 없습니다.</div>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}" begin="0" step="3">
							<img src="/tour/storage/${fn:split(dto.filename,',')[0]}"
								alt="${dto.title}">
							<section class=title>
								<a href="javascript:read('${dto.tid}')"><i
									class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a> <span
									id="score" style="color : #fffde7;"> <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
									<c:if test="${dto.score=='2'}">★★☆☆☆</c:if> <c:if
										test="${dto.score=='3'}">★★★☆☆</c:if> <c:if
										test="${dto.score=='4'}">★★★★☆</c:if> <c:if
										test="${dto.score=='5'}">★★★★★</c:if>
								</span>
							</section>
							<section class=info style="color:#808088">
								<span style="width: 100; overflow: hidden;"><i class="fas fa-user" ></i>
									${dto.nickname}</span><br> <span>Date :
									${dto.rdate.substring(0,10)}</span>
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
						<tr>
							<td colspan="6"></td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}" begin="1" step="3">
							<img src="/tour/storage/${fn:split(dto.filename,',')[0]}"
								alt="${dto.title }">

							<section class=title>

								<a href="javascript:read('${dto.tid}')"><i
									class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a> <span
									id="score" style="color : #fffde7;"> <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
									<c:if test="${dto.score=='2'}">★★☆☆☆</c:if> <c:if
										test="${dto.score=='3'}">★★★☆☆</c:if> <c:if
										test="${dto.score=='4'}">★★★★☆</c:if> <c:if
										test="${dto.score=='5'}">★★★★★</c:if>
								</span>
							</section>
							<section class=info style="color:#808088">
								<span style="width: 100; overflow: hidden;"><i class="fas fa-user"></i>
									${dto.nickname}</span> <span>Date :
									${dto.rdate.substring(0,10)}</span>
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
						<tr>
							<td colspan="6"></td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}" begin="2" step="3">
							<img src="/tour/storage/${fn:split(dto.filename,',')[0]}"
								alt="${dto.title }">
							<section class=title>
								<a href="javascript:read('${dto.tid}')"><i
									class="fab fa-slack-hash"></i>&nbsp<span>${dto.title}</span></a> <span
									id="score" style="color : #fffde7;"> <c:if test="${dto.score=='1'}">★☆☆☆☆</c:if>
									<c:if test="${dto.score=='2'}">★★☆☆☆</c:if> <c:if
										test="${dto.score=='3'}">★★★☆☆</c:if> <c:if
										test="${dto.score=='4'}">★★★★☆</c:if> <c:if
										test="${dto.score=='5'}">★★★★★</c:if>
								</span>
							</section>
							<section class=info style="color:#808088">
								<span style="width: 100; overflow: hidden;"><i class="fas fa-user"></i>
									${dto.nickname}</span> <span>Date :
									${dto.rdate.substring(0,10)}</span>
							</section>
						</c:forEach>

					</c:otherwise>
				</c:choose>

			</div>
		</div>

		<div class="paging">${paging3}</div>
	</div>
</body>
</html>