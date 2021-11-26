<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">


$(window).load(function () {
	console.log("장소명 목록 : " + atcname);
	console.log("주소 목록 : " + atcadd);
	
	// 맵, 마커 생성
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(y[0],x[0]),
	 	zoom : 11
	});
	
	    // 배열값을 마커, 좌표에 넣기
	for(i=0; i<x.length; i++){

	    
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(y[i], x[i]),
		    map: map

			});  //marker 생성
			
			var contentString = [
				'<a href="#imgarea'+atcname[i]+'"><div style="border : width:150px;text-align:center;padding:10px;">'+ atcname[i] +'</b>.</div>'
		    ].join('');	
		
		var infoWindow = new naver.maps.InfoWindow({
	        content: contentString,
	        maxWidth : 200,
	        contentColor : "#ffffff",
	        borderWidth : 5,
	        borderColor : "#5BA6A6",
	    	});  // 정보창 생성
        
	    	
	    	
	    //마커와 infowindow  배열에 담음
        marker_array.push(marker);
    	infoWindow_array.push(infoWindow);
	
	}//end of marker Loop
	
	// 정보창
	naver.maps.Event.addListener(map, 'idle', function() {
    updatemarker_array(map, marker_array);
	});
	
	for(i=0; i<marker_array.length; i++){
		const marker_ = marker_array[i];
        const infoWindow_ = infoWindow_array[i];
		
		naver.maps.Event.addListener(marker_, "mouseover", function(e)  {
        infoWindow_.open(map, marker_);
 		});
	

	}

	function updatemarker_array(map, marker_array) {
	
	    var mapBounds = map.getBounds();
	    var marker, position;
	
	    for (var i = 0; i < marker_array.length; i++) {
	
	        marker = marker_array[i]
	        position = marker.getPosition();
	
	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}
	
	function showMarker(map, marker) {
	
	    if (marker.setMap()) return;
	    marker.setMap(map);
	}
	
	function hideMarker(map, marker) {
	
	    if (!marker.setMap()) return;
	    marker.setMap(null);
	}
	
	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
	    return function(e) {
	        var marker = marker_array[seq],
	            infoWindow = infoWindow_array[seq];
	
	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	        	location.href = 'http://map.daum.net'
	        }
	    }
	}
	
	
	
	// 파노라마
	var pano = null;
	pano = new naver.maps.Panorama("pano", {
			position: new naver.maps.LatLng(y[0], x[0]),
	        pov: {
	            pan: -135,
	            tilt: 29,
	            fov: 100
	        }});
	
	var streetLayer = new naver.maps.StreetLayer();
	naver.maps.Event.once(map, 'init_stylemap', function() {
	    streetLayer.setMap(map);
	});

	// 거리뷰 버튼에 이벤트를 바인딩합니다.
	var btn = $('#street');
	btn.on("click", function(e) {
	    e.preventDefault();

	    // 거리뷰 레이어가 지도 위에 있으면 거리뷰 레이어를 지도에서 제거하고,
	    // 거리뷰 레이어가 지도 위에 없으면 거리뷰 레이어를 지도에 추가합니다.
	    if (streetLayer.getMap()) {
	        streetLayer.setMap(null);
	    } else {
	        streetLayer.setMap(map);
	    }
	});

	// 거리뷰 레이어가 변경되면 발생하는 이벤트를 지도로부터 받아 버튼의 상태를 변경합니다.
	naver.maps.Event.addListener(map, 'streetLayer_changed', function(streetLayer) {
	    if (streetLayer) {
	        btn.addClass('control-on');
	    } else {
	        btn.removeClass('control-on');
	    }
	});

	// 지도를 클릭했을 때 발생하는 이벤트를 받아 파노라마 위치를 갱신합니다. 이때 거리뷰 레이어가 있을 때만 갱신하도록 합니다.
	naver.maps.Event.addListener(map, 'click', function(e) {
	    if (streetLayer.getMap()) {
	        var latlng = e.coord;

	        // 파노라마의 setPosition()은 해당 위치에서 가장 가까운 파노라마(검색 반경 300미터)를 자동으로 설정합니다.
	        pano.setPosition(latlng);
	    }
	});
	// end of panorama
}); // end of function


//-------------------------------------- 윈도우 모두 로드되고나서 실행 -------------------------


//팝업
function popup(oid){
    var url = "./read"+"?oid="+oid;
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

// 좌표로 주소 찾기	
function ATC(address,name) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        
        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
	   
       console.log("-----함수내부------");
       console.log("주소 : " + address);
       console.log("x좌표 : " + item.x);
       console.log("y좌표 : " + item.y);
       console.log("-----함수end------");

       atcname.push(name);
	   atcadd.push(address);
       x.push(item.x);
       y.push(item.y);

    });
    
}

	var ad='부산광역시 남구 용호4동 용호로232번길 25-14'
	var x=[];
	var y=[];
	var name_array=[], address_array=[];
	var marker_array = [], infoWindow_array = [];
	var atcadd=[],atcname=[];

<c:forEach var="dto" items="${list}">
	var localename=String('${dto.oname}');
	var address=String('${dto.address}');
	ATC(address,localename);
</c:forEach>



</script>