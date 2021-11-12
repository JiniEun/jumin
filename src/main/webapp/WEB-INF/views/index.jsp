<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<script src="./js/weather.js"></script>
<script type="text/JavaScript">

/* 	$(function() {  
	let weatherIcon ={
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'fas fa-snowflake',
			'50' : 'fas fa-smog'
	};
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            $('#latitude').html(pos.coords.latitude);     // 위도
            $('#longitude').html(pos.coords.longitude);   // 경도
        })
        console.log(latitude, longitude);
        $.ajax({
        	//url : 'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=e586ddbaf2d677ed76dfd0d7b9e58c31&units=metric',
        	url : 'https://api.openweathermap.org/data/2.5/weather?lat=37&lon=137&appid=e586ddbaf2d677ed76dfd0d7b9e58c31&units=metric',
        	dataType:'JSON',
        	type : 'GET',
        	seccess : function(data){
        		
        		 
        		
        		//var $icon = (data.weather[0].icon).substr(0,2);
        		var $Temp = math.floor(data.main.temp) + 'º';
        		var $city = data.name;
        		
        		
        		
        		$('.wIcon').append('<i class="'+weatherIcon[$Icon] + '"></i>');
        		$('.rTemp').prepend($Temp);
        		$('.rCity').append($city);
        		
        		
        	}
		})
    } console.log(latitude,longitude);
	else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
	}); */


</script>
</head>
<body>
	<div class="container">
		<p>Main</p>
		
		<!-- <span id="latitude"></span>|<span id="longitude"></span> --> 
		<img id="wicon" src="#"><br>
		<span id="rtemp"></span><br> 
		<span id="rLoc"></span> 
			
		<img src="#" alt="">
        <img src="#" alt="">
        <img src="#" alt="">


		
	
	<!--</div>
	 <div class="weather">
		<div class = 'wIcon'></div>
		<div class = 'rTemp'></div>
		<div class = 'rCity'></div>
	</div> -->
	
</body>
</html>