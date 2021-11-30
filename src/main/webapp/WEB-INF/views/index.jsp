<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="./weather.js"></script> -->
<link rel="stylesheet" href="/resources/static/css/index.css">
<script>
/* $(document).ready(function(){
	
	   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
})
	.ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	.ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	}); */
	
function getLocation(latitude,longitude){
	let formdata = {'latitude' : latitude, 'longitude' : longitude};
	$.ajax({
    	url : '/',
    	type : 'post',
    	async: false,
    	data :  formdata,
    	success : function(data){
        	console.log(formdata);
        	document.querySelector("#rLoc").textContent
            = '${realLocation}';
            document.querySelector("#covid_region").textContent
                = '${covid[0]}';
                document.querySelector("#covid_total").textContent
                = '누적  ${covid[1]}';
                document.querySelector("#covid_today").textContent
                = '신규  ${covid[2]}';
                console.log('realLocation : ' + '${realLocation}');
                console.log('covid : ' + '${covid}');
    	}
	}); 
}
//지역 정보 받아오기
function showLocation(event) {
  let latitude = event.coords.latitude 
  let longitude = event.coords.longitude
  /*document.querySelector("#latitude").textContent = latitude // 위도 표기
  document.querySelector("#longitude").textContent = longitude // 경도 표기*/
  //비동기 통신으로 위치기반 날씨정보 받아오기 
  let apiKey = "e586ddbaf2d677ed76dfd0d7b9e58c31"
  let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" 
  				+ latitude  // 위도값
                + "&lon=" + longitude  // 경도값
                + "&appid=" + apiKey //인증키 값  
                + "&units=metric"; //화씨 > 섭씨 변환
                /*  let weatherIcon={
          	  '01' : 'fas fa-sun',
          	  '02' : 'fas fa-cloud-sun',
          	  '03' : 'fas fa-cloud',
          	  '04' : 'fas fa-cloudmeatball',
          	  '09' : 'fas fa-cloud-sun-rain',
          	  '10' : 'fas fa-cloud-showers-heavy',
          	  '11' : 'fas fa-poo-storm',
          	  '13' : 'fas fa-snowflake',
          	  '50' : 'fas fa-smog',
            }; */
            
           
         
	  /*  //지역명으로 받아오기              
   let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q="
               	+ "Gwangjin-gu" //지역 값
                + "&appid=" + apiKey //인증키 값  
                + "&units=metric"; //화씨 > 섭씨 변환                  
              //console.log(weatherUrl);           */                 
                
	let options = { method: 'GET' }
	
  $.ajax(weatherUrl, options).then((response) => {  
      console.log(response)
      let icon = response.weather[0].icon	//받아온 날씨의 기상 상태
      let iconUrl = "http://openweathermap.org/img/wn/" + icon + "@2x.png" // 기본아이콘 경로
      let img = document.querySelector("#wicon")
      img.src = iconUrl 
      document.querySelector("#rtemp").textContent 
      = (Math.round(response.main.temp) + "ºC")  // 현재 온도
      /* document.querySelector("#rLoc").textContent
      = response.name  // 현재 위치  */
    }).catch((error) => {
      console.log(error)
    })
                
    getLocation(latitude,longitude);
   
}
function showError(event) {
  alert("위치 정보를 얻을 수 없습니다.")
}
window.addEventListener('load', () => { 
  if(window.navigator.geolocation) {
     window.navigator.geolocation.getCurrentPosition(showLocation,showError)
  }
})
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="height: 150px; margin: 0 30px;">
			<div class="col-3 justify-content-center">
				<div>
					<img src="/images/logo_circle.gif" class="banners" alt="배너" />
				</div>
			</div>
			<div class="col txt-location" style="margin: 10px;">
				<img class="img-quote" src="/images/double_quote_left.png">
				<div class="ml-1 mr-1">

					<div class="l-flex">
						<img id="wicon" src="/images/loading.gif"> <span
							class="txt-temp" id="rtemp"></span>
					</div>
					<p id="rLoc" class="h4">${realLocation}</p>

				</div>
				<img class="img-quote-r" src="/images/double_quote_left.png">
			</div>
			<div class="col-3 align-items-center d-flex-end"
				style="margin: 10px;">
				<div class="row mb-3 justify-content-center"></div>
				<div class="row justify-content-center txt-covid">
					<div class="col">
						<h5>COVID-19</h5>
					</div>
					<div class="col d-flex">
						<div id="covid_region" class="h5 mb-0"></div>
						<div class="ml-20">
							<p class='font-weight-normal mb-0' id="covid_total"></p>
							<p class='font-weight-normal mb-0' id="covid_today"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card" style="margin: 30px;">
			<div class="row" style="margin: 5px;">
				<div class="col card" style="margin: 10px; padding-top: 15px;">
					<img class="card-img-top" src="/images/city.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">동네 나들이</h5>
						<p class="card-text">주요 시설 / 동네 스팟</p>
					</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 게시물</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty tourlist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="tdto" items="${tourlist}">
									<li class="list-group-item"><a
										href="/tour/read?tid=${tdto.tid}&col=&word=&nowPage=1"
										class="text-dark">${tdto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col card" style="margin: 10px; padding-top: 15px;">
					<img class="card-img-top" src="/images/city.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">동네 장터</h5>
						<p class="card-text">동네에서 다양한 물품들을 서로 거래해 보세요.</p>
					</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 게시물</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty marketlist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="mdto" items="${marketlist}">
									<li class="list-group-item"><a
										href="/market/read?mid=${mdto.mid}&col=&word=&nowPage=1"
										class="text-dark">${mdto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col card" style="margin: 10px; padding-top: 15px;">
					<div class="card-body">
						<h5 class="card-title">동네 모임 - 동호회</h5>
					</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 게시물</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty clublist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="cldto" items="${clublist}">
									<li class="list-group-item"><a
										href="/club/read/${cldto.clID}" class="text-dark">${cldto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="card-body">
						<h5 class="card-title">동네 모임 - 동네 친구</h5>
					</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 게시물</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty fboardlist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="fdto" items="${fboardlist}">
									<li class="list-group-item"><a
										href="/fboard/read?fbID=${fdto.fbID}" class="text-dark">${fdto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col card" style="margin: 10px; padding-top: 15px;">
					<img class="card-img-top" src="/images/city.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">동네 커뮤니티</h5>
						<p class="card-text">자유 게시판</p>
					</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 게시물</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty communitylist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="cdto" items="${communitylist}">
									<li class="list-group-item"><a
										href="/community/read/${cdto.cid}" class="text-dark">${cdto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>

		<div class="card" style="margin: 30px;">
			<div class="row" style="margin: 5px;">
				<div class="col-3 card" style="margin: 10px; text-align: center;">
					<div class="card-body">
						<h5 class="card-title">공지사항</h5>
						<p class="card-text">사이트 공지사항</p>
					</div>
				</div>
				<div class="col-8 card" style="margin: 10px;">
					<div class="card-body" style="padding-bottom: 0px;">
						<h5 class="card-title">최근 공지사항</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:choose>
							<c:when test="${empty noticelist}">
								<li class="list-group-item">등록된 글이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${noticelist}">
									<li class="list-group-item"><a
										href="/notice/read?nID=${dto.NID}&col=&word=&nowPage=1"
										class="text-dark">${dto.title}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>