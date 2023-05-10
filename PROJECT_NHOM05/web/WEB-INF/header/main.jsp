<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<header>
    <div class="logo" onclick="window.location.href='/dashboard';">
        <h1>NHOM 5</h1>
    </div>
    <nav>

        <c:if test="${sessionStaff.getAccessLevel() == 'STAFF'}">
            <a href="/bookings/">Đặt phòng</a>
			<a href="/guests/">DS khách hàng</a></a>
			<a href="/rooms/">DS phòng</a>
			<a href="/roomTypes/">Loại phòng</a>
        </c:if>
        <c:if test="${sessionStaff.getAccessLevel() == 'OWNER'}">
	           <a href="/bookings/">Đặt phòng</a>
				<a href="/guests/">DS khách hàng</a></a>
				<a href="/rooms/">DS phòng</a>
				<a href="/roomTypes/">Loại phòng</a>
				<a href="/staff/">DS nhân viên</a>
        </c:if>


    </nav>
    <div class="user">
        <h2>${sessionStaff.getName()}</h2>
        <a href="/auth/logout">Logout</a>
    </div>
</header>
