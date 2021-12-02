<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/static/css/fboard_list.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<style>
.btn-color2 {
	background-color: #5BA6A6;
	color: white;
}

.btn-color1 {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
<script type="text/javascript">
	function updateM(fbID) {
		var url = "/fboard/update";
		url += "?fbID=" + fbID;
		location.href = url;
	}
	function deleteM(fbID) {
		var url = "/fboard/delete";
		url += "?fbID=" + fbID;
		location.href = url;
	}

	function read(fbID) {
		var url = "read";
		url += "?fbID=" + fbID;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;

	}
	$(function() {
		$("a[data-toggle='tooltip']").tooltip();
	});
	function sendMessageFirst(fbID) {
		console.log("fbid:",fbID);
			$.ajax({
				url:"../message/message_send_first",
				method:"POST",
				data:{
					'fbID':fbID
				},
				success:function(data){
					console.log("data:",data);
					if(confirm("신청이 완료되었습니다. 메세지함을 확인하세요.")){
					location.href="../message/list";
					} else {
						console.log("취소");
					}
				},
				error: function() {
					alert('서버 에러');
				}
			});

	}
</script>
</head>
<body>

	<div id="features-wrapper" class="mt-4">
		<h2 class="col-12 text-center tm-section-title">동네친구</h2>
		<p class="col-12 text-center">
			가까이 있는 동네 친구를 만나보세요! <br> <br>
			<c:if test="${not empty sessionScope.ID}">
				<button type="button" class="btn btn-color1"
					onclick="location.href='../fboard/create'">글 등록하기</button>
			</c:if>
		<div class="container">
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
			</form>
			<div class="row">
				<div class="col-md-11">
					<c:forEach var="dto" items="${list}">
						<div class="media g-mb-30 media-comment">
							<img
								class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15"
								src="/images/profile.png" alt="Image Description">
							<div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
								<div class="g-mb-15">
									<div class="h8" style="color: #5BA6A6">
										<b> # ${dto.category} </b>
									</div>
									<h5 class="h5 g-color-gray-dark-v1 mb-0">${dto.title}</h5>
									<input type="hidden" name="regionID" id="regionID"
										value="${dto.regionID}" />
									<ul class="list-inline d-sm-flex my-0">

										<li class="list-inline-item ml-auto"><a
											class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover">
												<i class="far fa-clock"></i> ${dto.rdate }
										</a></li>
									</ul>
									<hr>
									<p>${dto.content}</p>
								</div>
								<hr>
								<ul class="list-inline d-sm-flex my-0">
									<li class="list-inline-item g-mr-20"><a
										class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover">
											<span>${dto.nickname } ·</span> <span>${dto.age} ·</span> <c:set
												var="gender" value="${dto.gender}" /> <c:choose>
												<c:when test="${gender == 'Female'}">
													<span>여성</span>
												</c:when>
												<c:otherwise>
													<span>남성</span>
												</c:otherwise>
											</c:choose>
									</a></li>
									<li class="list-inline-item ml-auto"><a
										class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover">
											<c:choose>
												<c:when test="${sessionScope.ID==dto.userID}">
									<%-- 				<button type="button" class="btn btn-color2"
														onclick="updateM('${dto.fbID}')">신청마감</button> --%>
													<button type="button" class="btn btn-color2"
														onclick="updateM('${dto.fbID}')">수정</button>
													<button type="button" class="btn btn-color2"
														onclick="deleteM('${dto.fbID}')">삭제</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-color2"
													onclick="sendMessageFirst('${dto.fbID}')">신청</button>
												</c:otherwise>
											</c:choose>
									</a></li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<br> ${paging }
		</div>
	</div>
</body>
</html>