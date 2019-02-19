<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div id="map" style="width: 100%; height: 800px;"></div>
<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw&submodules=geocoder"></script>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3700065, 127.121359),
    zoom: 9
});

var polylineoptions={
		path:new naver.maps.Point
};

var da = new Array();
var df = new Array();
da.push(new naver.maps.Point(127.209133, 37.009633));
da.push(new naver.maps.Point(127.120768, 36.990134));
df.push(da);
var ff = df[0];
var polyline = new naver.maps.Polyline({
    map: map,
    path: ff,
    strokeColor: '#5347AA',
    strokeWeight: 2
});

naver.maps.Event.addListener(map, 'click', function(e) {

	
    var point = e.coord;
    var path = polyline.getPath();
    

    new naver.maps.Marker({
        map: map,
        position: point
    });
});
</script>
</body>
</html>