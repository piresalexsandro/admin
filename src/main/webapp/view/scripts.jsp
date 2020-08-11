<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pt">
<head>
    <!-- ==========================
    	Meta Tags 
    =========================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <!-- ==========================
    	Title 
    =========================== -->
    <title>MESSER BRASIL</title>
    
    <!-- ==========================
    	Favicons 
    =========================== -->
	<link rel="shortcut icon" href="https://www.messer-br.com/wp-content/uploads/2019/08/favicon-messer-1.png" type="image/x-icon" />
	<link rel="apple-touch-icon" href="${path}/assets/icons/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="${path}/assets/icons/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="${path}/assets/icons/apple-touch-icon-114x114.png">
    
    <!-- ==========================
    	Fonts 
    =========================== -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    
    <!-- ==========================
    	CSS 
    =========================== -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${path}/css/loading.css" />
	<link rel="stylesheet" href="${path}/css/abas.css" />

	<STYLE TYPE="text/css" media="all">
	.ui-autocomplete { 
	    position: absolute; 
	    cursor: default; 
	    height: 200px; 
	    overflow-y: scroll; 
	    overflow-x: hidden;
	  }
	  body {
				background:none !important;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
		}  
	</STYLE>
    <!-- ==========================
    	JS 
    =========================== -->        
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="${path}/js/loading.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
	<script type="text/javascript" src="${path}/js/autocompleterCliente.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
	<script type="text/javascript">
			hideLoading();
	</script>
</head>
<body>
</body>
</html>