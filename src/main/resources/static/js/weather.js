//지역 정보 받아오기
function showLocation(event) {
  let latitude = event.coords.latitude 
  let longitude = event.coords.longitude
  document.querySelector("#latitude").textContent = latitude // 위도 표기
  document.querySelector("#longitude").textContent = longitude // 경도 표기

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
      document.querySelector("#rLoc").textContent
      = response.name  // 현재 위치
    }).catch((error) => {
      console.log(error)
    })
}

function showError(event) {
  alert("위치 정보를 얻을 수 없습니다.")
}

window.addEventListener('load', () => { 
  if(window.navigator.geolocation) {
     window.navigator.geolocation.getCurrentPosition(showLocation,showError)
  }

})