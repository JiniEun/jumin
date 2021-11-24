<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="./weather.js"></script> -->
<script>
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
            = '${location}'
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
		<div class="card" style="margin: 30px;">
			<div class="row" style="height: 200px; margin: 5px;">
				<div class="col-3" style="margin: 10px;">
					<h4>날씨</h4>
					<img id="wicon" src="#"> <br> <span id="rtemp"></span> <br>
					<span id="rLoc">${location }</span> 
				</div>
				<div class="col-8" style="margin: 10px;">
					<h4>코로나 정보</h4>
					<div>${html }</div>
				</div>
			</div>
		</div>

		<div class="card" style="margin: 30px;">
			<div class="row" style="height: 400px; margin: 5px;">
				<div class="col" style="background-color: #333333; margin: 10px;"></div>
				<div class="col" style="background-color: #333333; margin: 10px;"></div>
				<div class="col" style="background-color: #333333; margin: 10px;"></div>
				<div class="col" style="background-color: #333333; margin: 10px;"></div>
			</div>
		</div>

		<div class="card" style="margin: 30px;">
			<div class="row" style="height: 200px; margin: 5px;">
				<div class="col-3"
					style="background-color: #333333; margin: 10px; color: white;">썸네일</div>
				<div class="col-8" style="background-color: #333333; margin: 10px;"></div>

			</div>
		</div>
	</div>
</body>
</html>