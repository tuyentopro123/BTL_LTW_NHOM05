<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/one.css">
    <title>Guest</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>

<style>
    .guest-bookings tbody tr:hover, td:hover{
        background-color: #f5f5f5;
        cursor: pointer;
    }

</style>
<div class="content">
    <div class="model">
        <h1>${guest.getName()}</h1>
        <h3>Khách hàng</h3>
    </div>

    <div class="edit">
        <button class="delete" onclick="openModal('${guest.getName()}')">Xóa</button>
        <button onclick="window.location.href='/guests/${guest.getId()}/edit';">Sửa</button>
    </div>
    <div class="about">
        <h2>Thông tin chi tiết</h2>
        <div class="property">
            <span class="label">ID</span>
            <span class="data">${guest.getId()}</span>
        </div>
        <div class="property">
            <span class="label">Họ và tên</span>
            <span class="data">${guest.getName()}</span>
        </div>
        <div class="property">
            <span class="label">Địa chỉ</span>
            <span class="data">${guest.getDocument()}</span>
        </div>
        <div class="property">
            <span class="label">Ngày sinh</span>
            <span class="data">${guest.getBirthDate()}</span>
        </div>
        <div class="property">
            <span class="label">E-mail</span>
            <span class="data">${guest.getEmail()}</span>
        </div>
        <div class="property">
            <span class="label">Số điện thoại</span>
            <span class="data">${guest.getPhoneNumber()}</span>
        </div>

    </div>
    <c:if test="${!bookingList.isEmpty() }">
        <div class="guest-bookings">
            <h2>Bookings</h2>
            <div class="over">
                <table>
                    <thead>
                    <tr><th>ID</th><th>Bắt đầu</th><th>Kết thúc</th><th>Trạng thái</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookingList}" var="booking">
                        <tr onclick="window.location.href='/bookings/${booking.getId()}';"><td>${booking.getId()}</td><td>${booking.getArrival()}</td><td>${booking.getDeparture()}</td><td>${booking.getStatus()}</td></tr>
                    </c:forEach>
                    </tbody>
                </table>
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
            <button onclick="link(${guest.getId()})" class="cancel"> Xóa </button>
        </div>
    </div>
</div>
</body>
<script>
    let modal = document.getElementById("modal-delete");
    function openModal(guest) {
        modal.style.display = "flex";
        document.getElementById("sure").innerHTML = "Delete guest " + guest + "?";
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
        let url = "/guests/"+ id;
        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/guests" });
    }
</script>
</html>
