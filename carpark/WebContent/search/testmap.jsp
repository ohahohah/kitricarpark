<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
#container {overflow:hidden;height:300px;position:relative;}
#mapWrapper {width:100%;height:300px;z-index:1;}
#rvWrapper {width:50%;height:300px;top:0;right:0;position:absolute;z-index:0;}
#container.view_roadview #mapWrapper {width: 50%;}
#roadviewControl {position:absolute;top:5px;left:5px;width:65px;height:24px;padding:2px;z-index: 1;background: #f7f7f7;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;cursor: pointer;}
#roadviewControl span {background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker.png) no-repeat;  padding-left:23px;height:24px;font-size: 12px;display: inline-block;line-height: 2;font-weight: bold;}
#roadviewControl.active {background: #ccc;box-shadow: 0px 1px #5F616D;border: 1px solid #7F818A;}
#roadviewControl.active span {background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker_on.png) no-repeat;color: #4C4E57;}
#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
#close .img {display: block;background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}


</style>
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="../../documentation/#CategoryCode" target="_blank">카테고리 코드목록을 보시려면 여기를 클릭하세요!</a>
    </em>
</p>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4763b9e0f6cbc4102f42cb9f7b0f9167&libraries=services"></script>

<div id="container">
						    
						    <div id="mapWrapper">
						        <div id="searchmap" style="width:100%; height:350px;"></div> <!-- 지도를 표시할 div 입니다 --> 
							</div>
							
							<!-- Daum map script-->
							
						
						<script>
							
							var mapContainer = document.getElementById('searchmap'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
							var searchmap = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
							
							
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new daum.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							searchmap.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
							
							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new daum.maps.ZoomControl();
							searchmap.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
							
							//마우스 휠로 지도 확대,축소 가능여부를 설정합니다
							searchmap.setZoomable(false);  
							
							// 지도 타입 정보를 가지고 있을 객체입니다
							// map.addOverlayMapTypeId 함수로 추가된 지도 타입은
							// 가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
							// 이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
							// 자전거 도로 정보가 가장 앞에 표시됩니다
							var mapTypes = {    
							    traffic :  daum.maps.MapTypeId.TRAFFIC,
							    bicycle : daum.maps.MapTypeId.BICYCLE
							    
							};
							
							// 체크 박스를 선택하면 호출되는 함수입니다
							function setOverlayMapTypeId() {
							    var chkTraffic = document.getElementById('chkTraffic'),
							        chkBicycle = document.getElementById('chkBicycle');					    
							    // 지도 타입을 제거합니다
							    for (var type in mapTypes) {
							        searchmap.removeOverlayMapTypeId(mapTypes[type]);    
							    }
							 // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
							    if (chkTraffic.checked) {
							        searchmap.addOverlayMapTypeId(mapTypes.traffic);    
							    }
							    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
							    if (chkBicycle.checked) {
							        searchmap.addOverlayMapTypeId(mapTypes.bicycle);    
							    }
							}
							
							// 지도에 마커를 생성하고 표시한다
							var marker = new daum.maps.Marker({
							    position: new daum.maps.LatLng(37.566826, 126.9786567), // 마커의 좌표
							    map: searchmap // 마커를 표시할 지도 객체
							});

							// 마커 위에 표시할 인포윈도우를 생성한다
							var infowindow = new daum.maps.InfoWindow({
							    content : '<div style="padding:5px;">찾으신 주차장 :D</div>' // 인포윈도우에 표시할 내용
							});

							// 인포윈도우를 지도에 표시한다
							infowindow.open(searchmap, marker);
							
							</script>
					</div>

<div class="map_wrap">
							    <div id="aroundmap" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							    <ul id="category">
							        <li id="BK9" data-order="0"><span class="category_bg bank"></span>은행 </li>       
							        <li id="MT1" data-order="1"><span class="category_bg mart"></span>마트</li>  
							        <li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>약국</li>  
							        <li id="OL7" data-order="3"><span class="category_bg oil"></span>주유소</li>  
							        <li id="CE7" data-order="4"><span class="category_bg cafe"></span>카페</li>  
							        <li id="CS2" data-order="5"><span class="category_bg store"></span>편의점</li>      
							    </ul>
						</div>
						
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer2 = document.getElementById('aroundmap'), // 지도를 표시할 div 
    mapOption2 = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var aroundmap = new daum.maps.Map(mapContainer2, mapOption2); 


// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 
ps.setMap(aroundmap);

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(aroundmap, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data.places);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    for ( var i=0; i<places.length; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var marker2 = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order);
            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker2, place) {
                daum.maps.event.addListener(marker2, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker2, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker2 = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker2.setMap(aroundmap); // 지도 위에 마커를 표출합니다
    markers.push(marker2);  // 배열에 생성된 마커를 추가합니다

    return marker2;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content2 = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content2 += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
    }  else {
        content2 += '    <span title="' + place.address + '">' + place.address + '</span>';
    }                
   
    content2 += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content2;
    placeOverlay.setPosition(new daum.maps.LatLng(place.latitude, place.longitude));
    placeOverlay.setMap(aroundmap);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>








</body>
</html>