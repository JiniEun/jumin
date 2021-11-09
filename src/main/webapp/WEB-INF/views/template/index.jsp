<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기본페이지</title>

<meta charset="utf-8">

<style type="text/css">
img {
	display: inline;
}
</style>
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
	function getWeather(lat, lon) {
		fatch(
				`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${e586ddbaf2d677ed76dfd0d7b9e58c31}&units=metric`)
				.then(function(response) {
					return response.json();
				}).then(function(json) {
					console.log(json);
					const temparature = json.main.temp; //온도
					const place = json.name; // 사용자 위치
					weather.innerText = `${temparature} @${place}`;

				});
	}
</script>
</head>
<body>

	<div data-include-path="header.html"></div>
	<!-- <div>
        <p>main part</p>
        <button type="button" class="btn btn-dark">hi</button>

    </div> -->
	<!-- <div data-include-path="/공지관련/createForm.html"></div> -->
	<div data-include-path="/공지관련/list.html"></div>
	<!-- <div data-include-path="/공지관련/updateForm.html"></div> -->
	<!-- <div data-include-path="/공지관련/read.html"></div> -->
	<!-- <div data-include-path="/회원관련/createForm.html"></div> -->
	<!-- <div data-include-path="/회원관련/loginForm.html"></div> -->
	<!-- <div data-include-path="/회원관련/mypage.html"></div> -->
	<br>
	<div data-include-path="footer.html"></div>

	<script>
		window.addEventListener('load', function() {
			var allElements = document.getElementsByTagName('*');
			Array.prototype.forEach.call(allElements, function(el) {
				var includePath = el.dataset.includePath;
				if (includePath) {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							el.outerHTML = this.responseText;
						}
					};
					xhttp.open('GET', includePath, true);
					xhttp.send();
				}
			});
		});
	</script>

</body>
</html>