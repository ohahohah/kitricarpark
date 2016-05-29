<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.carpark.admin.model.*"%>
<%
List<ParkingDto> list = (List<ParkingDto>)request.getAttribute("searchlist");

%>    

<%@include file="/common/common.jsp" %>
<%@include file="/common/header/init.jsp" %> 

<!-- Simple Celander -->
<link rel="stylesheet" href="/carpark/css/calendar/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/carpark/js/calendar/calendar.js"></script>
<!-- Simple Celander -->

<!-- Custom CSS -->
<link href="/carpark/css/shop-item.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/carpark/css/normalize.css">
<link rel="stylesheet" href="/carpark/css/style.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<br><br><br><br>
	
    <!-- Page Content -->
	<div class="container" style="text-align:center">
			<%@include file="/common/searchBar.jsp"%>
		<br><br>
		
		
		<!-- Left List Group Strat -->
		
		<h3><b>도시이름 </b>&nbsp;&nbsp;검색 결과</h3>
				
   		<div class="col-md-4" style="overflow:scroll ; height: 600px;">
				<ul class="list-group">
				<!--  for-->
			
<%
ParkingDto parkingDto = new ParkingDto();
ParkingDetailDto parkingDetailDto = new ParkingDetailDto();
for(int i =0;i<list.size();i++){
	parkingDto = list.get(i);
//for(ParkingDto parkingDto :list){
%>
				<a href="<%=root%>/member?act=mvSearchResultDetail&parkingid=<%=parkingDto.getPark_id()%> &parkingname=<%=parkingDto.getPark_name()%>&latitude=<%=parkingDto.getLatitude()%>&longitude=<%=parkingDto.getLongitude()%>" class="list-group-item">					
				<form id="parkListForm" name="parkListForm" class="form-inline" role="form" method="post">

					<input type="hidden" name="act" value="mvSearchResultDetail">
					<input type="hidden" name="id" value="<%=parkingDto.getPark_id()%>">
					<input type="hidden" name="name" value="<%=parkingDto.getPark_name()%>">
					<input type="hidden" name="latitude" value="<%=parkingDto.getLatitude()%>">
					<input type="hidden" name="longitude" value="<%=parkingDto.getLongitude()%>">
					
						<h4 class="list-group-item-heading"><%=i+1%>.<%=parkingDto.getPark_name()%></h4>
						<div class="ratings">
                        <p class="pull-right">
                        <script>
                        //<%=parkingDetailDto.getPark_avgPoint()%>
                        </script>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            (4점)
                        </p>
                    </div>
						<p class="list-group-item-text"><%=parkingDto.getContent()%></p>
				</form>
				</a>
<%
}
%>			
				</ul>
			</div>
			<!-- Left List Group End -->
			
			<!-- Right Section -->
            <div class="col-md-8">
				
				<!-- Map -->
<<<<<<< HEAD
                <div class="thumbnail">
                
	                <div class="panel panel-default" id="map"></div>
	
					<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>,<%=parkingDto.getLongitude()%>), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					var map = new daum.maps.Map(mapContainer, mapOption);
					
					
					// 마커를 표시할 위치와 title 객체 배열입니다 
					//for => make positions list
		            
					var positions = new Array();
					
<%
for(int i =0;i<list.size();i++){
	parkingDto = list.get(i);		
//for(ParkingDto parkingDto :list){
%>	
		positions[i] = {content: <%=parkingDto.getPark_name()%>, 
        latlng: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>,<%=parkingDto.getLongitude()%>)}	
<%
}
%>					
//for end					
					//여러개의 마커에 마우스 이벤트를 등록합니다. 
					//마커에 마우스오버하면 인포윈도우에 마커의 타이틀을 표시하고 
					//마우스아웃하면 인포윈도우를 닫습니다.
					
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng // 마커의 위치
					    });

					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new daum.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });

					    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
					    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    (function(marker, infowindow) {
					        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
					        daum.maps.event.addListener(marker, 'mouseover', function() {
					            infowindow.open(map, marker);
					        });

					        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
					        daum.maps.event.addListener(marker, 'mouseout', function() {
					            infowindow.close();  
					        });
					     
					    })(marker, infowindow);
					  
					</script>
				</div>
				
                    <div class="caption-full">
                        <h4><a href="#">Product Name</a>
                        </h4>
                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                        <p>Want to make these reviews work? Check out
                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
                            </strong>over at maxoffsky.com!</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
=======
	                <div class="thumbnail">
	                
		                <div class="panel panel-default">
		
							<div id="daumlistmap" style="width:100%;height:650px;"></div>
							<script src="//apis.daum.net/maps/maps3.js?apikey=c2d873676f2c4854b2b2c62e165a629d"></script>
							<script>
								var mapContainer = document.getElementById('daumlistmap'), // 지도를 표시할 div 
								    mapOption = {
								        center: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>, <%=parkingDto.getLongitude()%>), // 지도의 중심좌표
								        level: 6, // 지도의 확대 레벨
								        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
								    }; 					
								// 지도를 생성한다 
								var listmap = new daum.maps.Map(mapContainer, mapOption); 					
								// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
								listmap.setDraggable(false);							
								// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
								listmap.setZoomable(false);   					
								
								// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
								var positions = new Array();
<%
for(int i =0;i<list.size();i++){
	parkingDto = list.get(i);
	System.out.println(parkingDto.getPark_name());
%>
								var parkName ='<div>주차장</div>'
								positions.push({
										content: parkName, 
								        latlng: new daum.maps.LatLng(<%=parkingDto.getLatitude()%>, <%=parkingDto.getLongitude()%>)
								});
<%
}
%>
								for (var i = 0; i < positions.length; i ++) {
								    // 마커를 생성합니다
								    var marker = new daum.maps.Marker({
								        map: listmap, // 마커를 표시할 지도
								        position: positions[i].latlng // 마커의 위치
								    });

								    // 마커에 표시할 인포윈도우를 생성합니다 
								    var infowindow = new daum.maps.InfoWindow({
								        content: positions[i].content // 인포윈도우에 표시할 내용
								    });

								    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
								    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
								    (function(marker, infowindow) {
								        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
								        daum.maps.event.addListener(marker, 'mouseover', function() {
								            infowindow.open(listmap, marker);
								        });

								        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
								        daum.maps.event.addListener(marker, 'mouseout', function() {
								            infowindow.close();
								        });
								    })(marker, infowindow);
								}
								
								
								
								//sigleMarker start
								// 지도에 마커를 생성하고 표시한다
								var listmarker = new daum.maps.Marker({
								    position: new daum.maps.LatLng(37.56682, 126.97865), // 마커의 좌표
								    map: listmap // 마커를 표시할 지도 객체
								});					
								// 마커 위에 표시할 인포윈도우를 생성한다
								var infowindow = new daum.maps.InfoWindow({
								    content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
								});		
								// 인포윈도우를 지도에 표시한다
								infowindow.open(map, listmarker);					
								// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
								daum.maps.event.addListener(listmarker, 'click', function() {
								    alert('마커를 클릭했습니다!');
								});					
								// 마커에 mouseover 이벤트를 등록한다
								daum.maps.event.addListener(listmarker, 'mouseover', function() {
								    console.log('마커에 mouseover 이벤트가 발생했습니다!');
								});					
								// 마커에 mouseout 이벤트 등록
								daum.maps.event.addListener(listmarker, 'mouseout', function() {
								    console.log('마커에 mouseout 이벤트가 발생했습니다!');
								});			
								//sigleMarker end
								
							</script>
						</div>
	                    <div class="caption-full">
	                        <h4><a href="#">Product Name</a>
	                        </h4>
	                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
	                        <p>Want to make these reviews work? Check out
	                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
	                            </strong>over at maxoffsky.com!</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
	                    </div>
	                    <div class="ratings">
	                        <p class="pull-right">3 reviews</p>
	                        <p>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star-empty"></span>
	                            4.0 stars
	                        </p>
	                    </div>
	                </div>
>>>>>>> c32de7a45a882c6a7176cbb332da56883331d09c
                </div>

                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This product was great in terms of quality. I would definitely buy another!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've alredy ordered another one!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

	<!-- Custom Theme JavaScript -->
	<script>
	
		// Closes the sidebar menu
		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		// Opens the sidebar menu
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		// Scrolls to the selected menu item on the page
		$(function() {
			$('a[href*=#]:not([href=#])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										|| location.hostname == this.hostname) {

									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html,body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});
		
	</script>
	<script src="/carpark/js/selectlist/jquery.selectlist.js"></script>
		<script type="text/javascript">
			$(function(){
				$('select').selectlist({
					zIndex: 10,
					width: 100,
					height: 30
				});		
			})
			
</script>



<!-- ****************************************************************************************************************** -->

<%@ include file="/common/footer.jsp" %>	