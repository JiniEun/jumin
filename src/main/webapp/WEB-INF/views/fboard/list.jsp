<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/static/css/fboard_list.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
	function read(fbID) {
		var url = "read";
		url += "?fbID=" + fbID;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;

	}
	$(function(){
		 $("a[data-toggle='tooltip']").tooltip();
		});
</script>
</head>
<body>

<div id="features-wrapper">
	<h2 style="color:#5BA6A6;" class="col-12 text-center tm-section-title">동네친구</h2>
	<p class="col-12 text-center">
					가까이 있는 동네 친구를 만나보세요!  <br> <br>
	<c:if test="${not empty sessionScope.ID}">
						<button type="button" class="btn btn-color1"
							onclick="location.href='../fboard/create'">글 등록하기</button>
					</c:if>
<div class="container">
<div class="row">
    <div class="col-md-10">
    <c:forEach var="dto" items="${list}">
        <div class="media g-mb-30 media-comment">
            <img class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Image Description">
            <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
              <div class="g-mb-15">
              	<i class="fa fa-cutlery" aria-hidden="true"></i><h8> &nbsp ${dto.category} </h8>
                <h5 class="h5 g-color-gray-dark-v1 mb-0">${dto.title}</h5>
                <br>
      
              </div>
        
              <p>${age}${dto.nickname} </p>
              <hr>
              <ul class="list-inline d-sm-flex my-0">
                <li class="list-inline-item g-mr-20">
                  <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="#!">
                    <i class="fa fa-align-justify"></i>
                    조회 ${dto.viewcnt}
                  </a>
                </li>
                <li class="list-inline-item g-mr-20">
                  <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="#!">
                    <i class="fa fa-thumbs-down g-pos-rel g-top-1 g-mr-3"></i>
                    34
                  </a>
                </li>
                <li class="list-inline-item ml-auto">
                  <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="#!">
                    <i class="fa fa-reply g-pos-rel g-top-1 g-mr-3"></i>
                    ${dto.rdate }
                  </a>
                </li>
              </ul>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
</div>
</div>
</body>
</html>