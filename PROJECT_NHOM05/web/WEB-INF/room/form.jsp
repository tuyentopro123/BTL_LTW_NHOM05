<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Rooms</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/rooms" id="form" <c:if test="${room == null}">method="POST" </c:if> >
        <h1><c:choose><c:when test="${room == null}">Phòng</c:when><c:otherwise>Edit</c:otherwise></c:choose> Mới</h1>
        <label for="number">Số</label>
        <input type="number" name="number" id="number" autofocus="autofocus" value="${room.getNumber()}" required>
        <label for="id_room_type">Loại phòng</label>
        <select name="id_room_type" id="id_room_type" required>
            <option disabled selected value></option>
            <c:forEach items="${roomTypeList}" var="roomType">
                <option value="${roomType.getId()}" <c:if test="${roomType.getId() == room.getRoomType().getId()}"> selected </c:if>>${roomType.getName()}</option>
            </c:forEach>
        </select>
        <div class="submit">
            <button onclick="window.history.go(-1);" type="button">Trở lại</button>
            <input type="submit" value="Xác nhận" id="button">
        </div>
    </form>
</div>
</body>
<script>
    function send(e){
        e.preventDefault();
        let url = "/rooms/${room.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'number': document.getElementById("number").value,
                'id_room_type': document.getElementById("id_room_type").value,
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>

