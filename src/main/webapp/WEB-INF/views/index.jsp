<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<style></style>
<script src="http://code.jquery.com/jquery-lastest.js"></script>
<script type="text/JavaScript">
$(function() {        
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            $('#latitude').html(pos.coords.latitude);     // 위도
            $('#longitude').html(pos.coords.longitude); // 경도
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
function askForCoords(){
        navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
      }
      
function handleGeoSucces(position){
    const latitude =  position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
      latitude,
      longitude
    };
    saveCoords(coordsObj);
    getWeather(latitude, longitude);
  }

  function handleGeoError(position){
    console.log('Cant get your position.');
  }      


function getWeather(lat, lon){
    fetch(
      `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
    )
      .then(function(response){
      return response.json();
    })
      .then(function(json){
        console.log(json);
        const temparature = json.main.temp;  //온도
        const place = json.name;   // 사용자 위치
        weather.innerText = `${temparature} @${place}`;

      });
  }


</script>
</head>
<body>
	<div class="container">
		<p>Main</p>
		<li>위도:<span id="lat"></span></li>
        <li>경도:<span id="lon"></span></li>
        <li>온도:<span id="temparature"></span></li>
        <li>위치:<span id="place"></span></li>
        <img src="./images/jeans.jpg" alt="Jeans">
		

	</div>
</body>
</html>