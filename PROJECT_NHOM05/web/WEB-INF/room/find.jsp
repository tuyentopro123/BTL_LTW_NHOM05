<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/one.css">
    <title>Room</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <div class="model">
        <h1>Phòng</h1>
        <h3>${room.getAvailability()}</h3>
    </div>
    <c:if test="${allowed == true}">
    <div class="edit">
        <button class="delete" onclick="openModal(${room.getNumber()})">Xóa</button>
        <button onclick="window.location.href='/rooms/${room.getId()}/edit';">Sửa</button>
    </div>
    </c:if>
    <div class="about">
        <h2>Thông tin chi tiết</h2>
        <div class="property">
            <span class="label">ID</span>
            <span class="data">${room.getId()}</span>
        </div>
        <div class="property">
            <span class="label">Số phòng</span>
            <span class="data">${room.getNumber()}</span>
        </div>
        <div class="property link" onclick="window.location.href='/roomTypes/${room.getRoomType().getId()}';">
            <span class="label">Loại phòng</span>
            <span class="data">${room.getRoomType().getName()}</span>
        </div>
    </div>
    <c:if test="${booking != null}">
    <div class="booking-info about" onclick="window.location.href='/bookings/${booking.getId()}';">
        <h2>Booking</h2>
        <div class="property">
            <span class="label">ID</span>
            <span class="data">${booking.getId()}</span>
        </div>
        <div class="property">
            <span class="label">Bắt đầu</span>
            <span class="data">${booking.getArrival()}</span>
        </div>
        <div class="property">
            <span class="label">Kết thúc</span>
            <span class="data">${booking.getDeparture()}</span>
        </div>
        <div class="property">
            <span class="label">Khách hàng</span>
            <span class="data">${booking.getGuest().getName()}</span>
        </div>
    </div>
    </c:if>
</div>
<div class="modal" id="modal-delete">
    <div class="modal-content">
        <div class="modal-header">
            <h1>Xóa</h1>
        </div>
        <div class="modal-body" id="sure">
        </div>
        <div class="modal-footer">
            <button onclick="cancel()" type="button">Trở lại</button>
            <button onclick="link(${room.getId()})" class="cancel"> Xóa </button>
        </div>
    </div>
</div>
</body>
<script>
    let modal = document.getElementById("modal-delete");
    function openModal(room) {
        modal.style.display = "flex";
        document.getElementById("sure").innerHTML = "Delete room " + room + "?";
    }
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

    function cancel(){
        modal.style.display = "none";
    }


    function link(id) {
        let url = "/rooms/"+ id;
        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/rooms" });
    }
</script>
</html>
