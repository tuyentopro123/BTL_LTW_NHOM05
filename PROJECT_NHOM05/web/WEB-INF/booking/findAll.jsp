<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Đặt phòng</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1>Danh sách đặt phòng</h1>
    <div class="over">
        <table>
            <thead>
                <tr>
                	<th>Khách hàng</th>
                	<th>Bắt đầu</th>
                	<th>Kết thúc</th>
                	<th>Phòng</th>
                	<th>Tổng tiền</th>
                	<th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${bookingList}" var="booking">
                <tr onclick="window.location.href='/bookings/${booking.getId()}';">
                	<td>${booking.getGuest().getName()}</td>
                	<td>${booking.getArrival()}</td>
                	<td>${booking.getDeparture()}</td>
                	<td>${booking.getRoom().getNumber()}</td>
                	<td>
                		<fmt:formatNumber value="${booking.getTotal()}" pattern="###,### VNĐ"/>
                	</td>
                	<td>${booking.getStatus()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="submit">
        <button onclick="window.location.href='/bookings/new';">Đặt phòng</button>
    </div>
</div>
</body>
</html>


