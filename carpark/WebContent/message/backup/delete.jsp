<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.carpark.member.model.*"%>
<%
MessageDto messageDto = (MessageDto) request.getAttribute("messageView");
%>

<%@ include file="/common/common.jsp" %>
<%@ include file="/common/header/init.jsp" %>
<%@ include file="/common/side.jsp" %>

<div id="wrapper">

<!-- ****************************************************************************************************************** -->

		<!-- main -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- 쪽지내용 -->
				
				<div class="form-group">
				<form name="messageForm" method="get" action="">
				<input type="hidden" name="act" id="act" value="messageSearch">
				<input type="hidden" name="bcode" id="bcode" value="2">
				<input type="hidden" name="pg" id="pg" value="1">
					<select name="key">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자</option>
					</select>
					<input type="text" name="word">
					<input type="button" value="검색" onclick="javascript:messageSearch();">
				</form>
				</div>

<center>
<h3>글이 삭제되었습니다</h3>
</center>

<input type="button" value="목록" onclick="javascript:messageReceiveList();">
				
			</div>
		</div>

<!-- ****************************************************************************************************************** -->	

</div>

<%@ include file="/common/footer.jsp" %>