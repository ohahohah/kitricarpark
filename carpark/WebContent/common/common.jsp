<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.carpark.member.model.*, com.carpark.admin.model.*,
com.carpark.util.*,java.util.*,com.carpark.common.model.*"%>
<%
String root = request.getContextPath();
String commonpath = root + "/common";
String headerpath = commonpath+ "/header";
String adminpath = root + "/admin";
String customerpath = adminpath +"/"+"customer";
String parkingpath = adminpath +"/"+"parking";
String qnapath = adminpath +"/"+"qna";
String staticpath = adminpath +"/"+"static";
MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo"); 
HttpSession loginSession = request.getSession();
if(loginSession==null){
	System.out.println("세션만료!~");
%>

<% 
	response.sendRedirect(root+"/index.jsp");
	return;
}
int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
int pg = NumberCheck.nullToOne(request.getParameter("pg"));
String key = StringCheck.nullToBlank(request.getParameter("key"));
String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
String auth = StringCheck.nullToBlank(request.getParameter("auth"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="admin_160518">
    <meta name="author" content="SiYoungOh">
 
    <link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">
    <link href="<%=root %>/css/stylish-portfolio.css" rel="stylesheet">
    <link href="<%=root %>/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="<%=root %>/css/custom_kitri.css" rel="stylesheet">
	
	<link rel="stylesheet" href="/carpark/css/normalize.css">
	<link rel="stylesheet" href="/carpark/css/style.css">
	<!-- login -->
	<script type="text/javascript">
	var root = "<%=root%>";
	</script>
	<script type="text/javascript" src="<%=root%>/js/member/login.js"></script>
	<script type="text/javascript" src="<%=root%>/admin/js/adminCall.js"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body onunload="javascript:closeWin();">
    <!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="<%=root %>/js/plugins/morris/raphael.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris-data.js"></script>
   <!-- bootbox(modal) JavaScript -->
   <script src="<%=root %>/js/bootbox.min.js"></script>
   <!-- Fuel UX CDN -->
   <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//www.fuelcdn.com/fuelux/3.13.0/css/fuelux.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="//www.fuelcdn.com/fuelux/3.13.0/js/fuelux.min.js"></script>
    
    <!-- message.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
    
    <!-- report.js -->
    <script type="text/javascript" src="<%=root %>/report/report.js"></script>
    <script type="text/javascript" src="<%=root %>/admin/report/adminreport.js"></script>

    <!-- parking.js -->
    <script type="text/javascript" src="<%=root %>/parking/parking.js"></script> 
    <script type="text/javascript" src="<%=root %>/admin/parking/adminparking.js"></script> 
    
    <!-- admincall.js -->
    <script type="text/javascript" src="<%=root %>/message/message.js"></script>
       
    <form name="common" method="get" action="">
	<input type="hidden" name="act" id="act" value="">
	<input type="hidden" name="bcode" id="bcode" value="<%=bcode%>">
	<input type="hidden" name="pg" id="pg" value="<%=pg%>">
	<input type="hidden" name="key" id="key" value="">
	<input type="hidden" name="word" id="word" value="">
	<input type="hidden" name="seq" id="seq" value="">
	<input type="hidden" name="parkId" id="parkId" value="">
	<input type="hidden" name="flag" id="flag" value="">
	<input type="hidden" name="auth" id="auth" value="">
	</form>
	
    