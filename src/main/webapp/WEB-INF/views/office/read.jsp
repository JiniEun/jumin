<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=92xk29w19e&submodules=geocoder"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=panorama"></script>
    <title>Document</title>
</head>

<style type="text/css">
body{height : 100%; width : 100%;}
.pano{height : 100%; width : 100%;}

</style>

<script>
$(window).load(function (){
console.log("작동");
//파노라마
var pano = null;

pano = new naver.maps.Panorama("pano", {
		position: new naver.maps.LatLng(y[0], x[0]),
        pov: {
            pan: -135,
            tilt: 29,
            fov: 100
        }});
console.log("1");
console.log("x좌표 :" + x[0]);
console.log("y좌표 :" + y[0]);


})   

var x=[];
var y=[];
ATC('${dto.address}');


function ATC(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        
        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
			
        x.push(item.x);
        y.push(item.y);
        console.log("함수내부x좌표 :" + x);
        console.log("함수내부y좌표 :" + y);
    });   
}        
</script>

<body>
    <div class="pano" id="pano" style="height : 720px; width :1080px;">
    panoarea</div>
</body>
</html>