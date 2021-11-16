<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
var ad='부산광역시 남구 용호4동 용호로232번길 25-14'
var xlocale=[];
var ylocale=[];

$(document).ready(function () {
		// 도로명 주소를 좌표 값으로 변환(API)
		console.log(ad);
		naver.maps.Service.geocode({
	        query: ad
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.v2, // 검색 결과의 컨테이너
	            items = result.addresses; // 검색 결과의 배열
	            
	        // 리턴 받은 좌표 값을 변수에 저장
	        item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
	        
	            x=item.x;
	            y=item.y;
	            console.log(x);
		        console.log(y);
		        xlocale.push(x);
		        ylocale.push(y);
		        
	            
	        
	        // 지도 생성
	        var map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(y, x), // 지도를 열 좌표
				zoom: 18
			});
			
	        // 지도에 해당 좌표 마커(아이콘 설정)
	        var markerOptions = {
	        	    position: new naver.maps.LatLng(y, x), //마커찍을 좌표
	        	    map: map,
	        	    icon: {
	        	        url: 'resources/img/marker.png', //아이콘 경로
	        	        size: new naver.maps.Size(22, 36), //아이콘 크기
	        	        origin: new naver.maps.Point(0, 0),
	        	        anchor: new naver.maps.Point(11, 35)
	        	    }
	        	};
	        
	        // 마커 생성
	        var marker = new naver.maps.Marker(markerOptions);
			
	        
	    });
		
	});
	
console.log(xlocale);
console.log(ylocale);
console.log(xlocale[0]);
console.log(ylocale[0]);

    
</script>