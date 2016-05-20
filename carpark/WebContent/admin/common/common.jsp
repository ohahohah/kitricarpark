<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();
String adminpath = root + "/admin";
String customerpath = adminpath +"/"+"customer";
String parkingpath = adminpath +"/"+"parking";
String qnapath = adminpath +"/"+"qna";
String staticpath = adminpath +"/"+"static";
String memberpath = root+"/member";
String infopath = memberpath+"/"+"info";
String detailInfopath = memberpath+"/"+"detailInfo";

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
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>
    <!-- jQuery -->
    <script src="<%=root %>/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root %>/js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="<%=root %>/js/plugins/morris/raphael.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris.min.js"></script>
    <script src="<%=root %>/js/plugins/morris/morris-data.js"></script>
   