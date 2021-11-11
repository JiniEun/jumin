<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>weather</title>

<style>
.img {
	position: fixed;
	background-image: url(sunny.png);
	height: 85px;
	width: 85px;
	top: 150px;
	right: 25px;
	background-size: cover;
}

/* .img-cover{
        position: absolute;
        
        height: 85px;
        width : 85px;
        top : 150px;
        right : 25px;
        height: 50%;
        width : 50%;
        background-color: rgba(0, 0, 0, 0.7);                                                                
        z-index:1;
    } */
.img .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 0.5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/JavaScript">
	/* function weather(){
	 jQuery.ajax({
	 url : "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0",
	 type : "get",
	 timeout : 30000,
	 contentsType : "application/json",
	 dataType : "json",
	 success : function(data, status , xhr){
	 let dataHeader = data.result .response.header.resultcode;
	
	 if (datyHeader == "00"){
	 console.log("success == >");
	 console.log(data);
	 }else{
	 console.log("fail == >");
	 console.log(data);
	 }
	 },
	 error : function(e, status,xhr, data){
	 console.log("error == >");
	 console.log(e);
	 }
	 });
	
	 } */
	 
	 function handleGeoSucc(position) {
		    console.log(position);
		    const latitude = position.coords.latitude;  // 경도  
		    const longitude = position.coords.longitude;  // 위도
		    const coordsObj = {
		        latitude,
		        longitude
		    }
		    saveCoords(coordsObj);
		    getWeather(latitude, longitude);
		}

		function handleGeoErr(err) {
		    console.log("geo err! " + err);
		}
		function requestCoords() {
		    navigator.geolocation.getCurrentPosition(handleGeoSucc, handleGeoErr);
		}	

	 function getWeather(lat, lon) {
		    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`)
		    .then(res => res.json())
		    .then(data => {
		        console.log(data);
		        const temp = data.main.temp;
		        const weathers = data.weather[data.weather.length -1];
		        weatherIcon.src = `https://openweathermap.org/img/wn/${weathers.icon}@2x.png`;
		        weatherSpan.innerHTML = `${temp}&#176;C ${weathers.main}`;
		    })
		}
</script>

</head>
<body>

	<!-- <div class = 'weather'>
        <div class = 'Curricon'></div>
        <div class = 'CullTemp'></div>
        <div class = 'City'><</div> -->
	<!-- <div class="location_area">
            <span class="blind"></span>
            <strong class="location_name"></strong>
            <button type="button" class="btn_location" data-loading-class="loading" onclick="nclk_v2(this, 'gnb.curloc', '', '')"><span class="blind">내위치 찾기</span></button>
        </div> -->

</body>
</html>