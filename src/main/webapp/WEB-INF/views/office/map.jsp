<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	<c:forEach var="dto" items="${list}">

	var localname = String('${dto.oname}');
	var address = String('${dto.address}');
	ATC(address, localname);

	var x = [];
	var y = [];
	var name_array = [], address_array = [];
	var marker_array = [], infoWindow_array = [];
	var atcadd = [], atcname = [];
	/* 	var marker;
	 var contentString;
	 var infoWindow; */

	function ATC(address, localname) {
		naver.maps.Service
				.geocode(
						{
							query : address
						},
						function(status, response) {
							if (status === naver.maps.Service.Status.ERROR) {
								return alert('Something wrong!');
							}

							var htmlAddresses = [];
							var item = response.v2.addresses[0];
							var point = new naver.maps.Point(item.x, item.y);

							atcname.push(localname);
							atcadd.push(address);
							var x1 = item.x;
							x.push(item.x);
							var y1 = item.y;
							y.push(item.y);
 
							// 배열값을 마커, 좌표에 넣기
							for (i = 0; i < x.length; i++) {
								var HOME_PATH = window.HOME_PATH || '.';
								var marker = new naver.maps.Marker(
										{
											position : new naver.maps.LatLng(
													y[i], x[i]),
											map : map,
										}); //marker 생성
								console.log("atcname[i]", i, atcname[i]);
								var contentString = [ '<a href="#imgarea'+atcname[i]+'"><div class="marker-link" id="map'+atcname[i]+'" style="border : width:150px;text-align:center;padding:10px;">'
										+ atcname[i] + '</b></div>' ].join('');
								var infoWindow = new naver.maps.InfoWindow({
									content : contentString,
									maxWidth : 200,
									contentColor : "#ffffff",
									borderWidth : 5,
									borderColor : "#5BA6A6",
								}); // 정보창 생성
								//마커와 infowindow  배열에 담음
								marker_array.push(marker);
								infoWindow_array.push(infoWindow);
							}//end of marker Loop

							// 지도를 클릭했을 때 발생하는 이벤트를 받아 파노라마 위치를 갱신합니다. 이때 거리뷰 레이어가 있을 때만 갱신하도록 합니다.
							naver.maps.Event.addListener(map, 'click',
									function(e) {
										if (streetLayer.getMap()) {
											// 파노라마의 setPosition()은 해당 위치에서 가장 가까운 파노라마(검색 반경 300미터)를 자동으로 설정합니다.
											pano.setPosition(e.coord);
										}
									});

							// 정보창
							naver.maps.Event.addListener(map, 'idle',
									function() {
										updatemarker_array(map, marker_array);
									});

							for (i = 0; i < marker_array.length; i++) {
								const marker_ = marker_array[i];
								console.log("marker_", marker_);
								const infoWindow_ = infoWindow_array[i];

								naver.maps.Event.addListener(marker_,
										"mouseover", function(e) {
											infoWindow_.open(map, marker_);
										});
							}

							function updatemarker_array(map, marker_array) {

								var mapBounds = map.getBounds();
								var marker_in, position;

								for (var i = 0; i < marker_array.length; i++) {

									marker_in = marker_array[i]
									position = marker_in.getPosition();

									if (mapBounds.hasLatLng(position)) {
										showMarker(map, marker_in);
									} else {
										hideMarker(map, marker_in);
									}
								}
							}

							function showMarker(map, marker) {

								if (marker.setMap())
									return;
								marker.setMap(map);
							}

							function hideMarker(map, marker) {

								if (!marker.setMap())
									return;
								marker.setMap(null);
							}

							// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
							function getClickHandler(seq) {
								return function(e) {
									var marker = marker_array[seq], infoWindow = infoWindow_array[seq];

									if (infoWindow.getMap()) {
										infoWindow.close();
									} else {
										location.href = 'http://map.daum.net'
									}
								}
							}

							for (var i = 0, ii = marker_array.length; i < ii; i++) {
								naver.maps.Event.addListener(marker_array[i],
										'click', getClickHandler(i));
							}

						});

	}

	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(y[0], x[0]),
		zoom : 11
	});

	var pano = null;

	naver.maps.onJSContentLoaded = function() {
		pano = new naver.maps.Panorama("pano", {
			position : new naver.maps.LatLng(y[0], x[0]),
			pov : {
				pan : -135,
				tilt : 29,
				fov : 100
			}
		});

		// 파노라마 위치가 갱신되었을 때 발생하는 이벤트를 받아 지도의 중심 위치를 갱신합니다.
		naver.maps.Event.addListener(pano, 'pano_changed', function() {
			var latlng = pano.getPosition();

			if (!latlng.equals(map.getCenter())) {
				map.setCenter(latlng);
			}
		});

	};

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
	naver.maps.Event.addListener(map, 'streetLayer_changed', function(
			streetLayer) {
		if (streetLayer) {
			btn.addClass('control-on');
		} else {
			btn.removeClass('control-on');
		}
	});

	//팝업
	function popup(oid) {
		var url = "./read" + "?oid=" + oid;
		var name = "popup test";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	</c:forEach>
</script>