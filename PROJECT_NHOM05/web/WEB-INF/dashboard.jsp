<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=0">
    <title>Dashboard</title>

    <c:if test="${sessionStaff.getAccessLevel() == 'STAFF'}">
        <c:set var="css" value="/css/dash.css" />
    </c:if>
    <c:if test="${sessionStaff.getAccessLevel() == 'OWNER'}">
        <c:set var="css" value="/css/ownerDash.css" />
    </c:if>


    <link rel="stylesheet" type="text/css" href="${css}">
	    <style>
	    	.welcome-message {
			   height: 100%;
			   width: 100%;
			   background-image: url('https://static.mservice.io/img/momo-upload-api-220617171330-637910828105829663.jpg');
			   background-repeat: no-repeat;
			   background-size: cover;
			   background-position: bottom;
			}
			
			.welcome-message h1 {
			   font-size: 36px;
			   color: #333;
			   text-align: center;
			}
			
	    </style>
</head>
<body>

<c:import url="/WEB-INF/header/main.jsp"/>
<c:if test="${sessionStaff.getAccessLevel() == 'STAFF'}">
    <div class="welcome-message">
	 <div class="box"> 
	   <h1>Chào mừng đến với trang quản lý đặt phòng</h1>
	</div>
</div>
</c:if>
<c:if test="${sessionStaff.getAccessLevel() == 'OWNER'}">
    <c:import url="/WEB-INF/ownerDashboard.jsp"/>
</c:if>
</body>
</html>
