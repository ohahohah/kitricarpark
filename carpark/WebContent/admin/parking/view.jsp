<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header/init.jsp" %>
<%@include file="/admin/common/sidebar.jsp" %>

<!-- ************************************************************************************ -->

<!-- ************************************************************************************ -->	
<%
if(memberDto != null){ 

ParkingDetailDto parkingDto = (ParkingDetailDto) request.getAttribute("parkingView");

if(parkingDto != null) {
%>
<div id="wrapper">

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<br>
			<!-- 본문내용 -->
			<div class="col-md-10">
			<form name="adminParkRegisterForm" method="post" action="">
				<input type="hidden" name="act" value="adminParkingRegister">				
				
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 구분</b><br>
					</div>
					<div class="col-md-10">
<%
if("0".equals(parkingDto.getPark_type())) {
%>
	개인
<%
} else {
%>
	사설
<%	
}
%>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>사용가능여부</b><br>
					</div>
					<div class="col-md-10">
<%
if(0 == parkingDto.getPark_flag()) {
%>
	사용가능
<%
} else {
%>
	사용불가
<%
}
%>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 이름</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getPark_name() %>
					</div><br>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>위치</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getDetailAddr() %>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getFacility() %>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-2">
						<b>보유시설상세</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getFeature() %>
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<b>평일</b><br>
					</div>
					<div class="col-md-10">
<%
if("0" == parkingDto.getPay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>
					</div>
				</div><br>		
				
				<div class="row">
					<div class="col-md-2">
						<b>토요일</b><br>
					</div>
					<div class="col-md-10">
<%
if("0" == parkingDto.getSatur_pay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>	
					</div>
				</div><br>			
				
				<div class="row">
					<div class="col-md-2">
						<b>공휴일</b><br>
					</div>
					<div class="col-md-10">
<%
if("0" == parkingDto.getHoli_pay_yn()) {
%>
	무료
<%
} else {
%>
	유료
<%
}
%>				
					</div>
				</div><br>			
				
				<div class="row">
					<div class="col-md-2">
						<b>총 주차면수</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getPark_capacity() %>			
					</div>
				</div><br>			
				
				<div class="row">
					<div class="col-md-2">
						<b>기본주차시간</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getPark_time_rate() %> 시간			
					</div>
				</div><br>			
				
				<div class="row">
					<div class="col-md-2">
						<b>기본주차시간</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getPark_rate() %> 코인			
					</div>
				</div><br>			

				<div class="row">
					<div class="col-md-2">
						<b>추가단위요금</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getAdd_park_rate() %> 코인			
					</div>
				</div><br>			
									
				<div class="row">
					<div class="col-md-2">
						<b>하루최대요금</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getDay_max_pay() %> 코인			
					</div>
				</div><br>			

				<div class="row">
					<div class="col-md-2">
						<b>월정기권</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getFulltime_monthly_pay() %> 코인		
					</div>
				</div><br>	
				
				<div class="row">
					<div class="col-md-2">
						<b>주차장 설명</b><br>
					</div>
					<div class="col-md-10">
						<%=parkingDto.getContent() %>
					</div>
				</div><br>
			</form>
	
				<div class="row">
						<p align="center">
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:adminParkingList('<%=pg%>');">목록</button>
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:adminParkingMvModify('<%=parkingDto.getPark_id()%>');">수정</button>
		  					<button type="button" class="btn btn-default btn-lg" onclick="javascript:adminParkingDelete('<%=parkingDto.getPark_id()%>');">삭제</button>
						</p>
				</div>
			</div>
			
	
				
			
		</div>
	</div>
	</div>
	
<%@ include file="/common/footer.jsp" %>		
<%
} else {
%>
	해당 주차장이 없습니다
<%
}
}else{
%>
<script type="text/javascript">
alert("잘못된 접근입니다. 다시 시도해주세요.");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>
	