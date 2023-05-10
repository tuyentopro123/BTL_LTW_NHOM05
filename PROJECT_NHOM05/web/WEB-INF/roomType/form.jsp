<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Loại phòng</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">

</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/roomTypes" id="form" <c:if test="${roomType == null}">method="POST" accept-charset="UTF-8" </c:if> >
        <h1><c:choose><c:when test="${roomType == null}">Loại</c:when><c:otherwise>Edit</c:otherwise></c:choose> phòng mới</h1>
        <label for="name">Tên</label>
        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus"
               value="${roomType.getName()}" required>
        <label for="description">Mô tả</label>
        <textarea name="description" id="description" cols="30" rows="5" required>${roomType.getDescription()}</textarea>
        <label for="daily_price">VNĐ/ngày</label>
        <input type="number" name="daily_price" id="daily_price" min="0" max="1000000" step="1000"
               value="${roomType.getDailyPrice()}" required>

        <div class="submit">
            <button onclick="window.history.go(-1);" type="	button">Trở lại</button>
            <input type="submit" value="Xác nhận" id="button">
        </div>
    </form>
</div>
</body>

<script>
    function send(e){
        e.preventDefault();
        let url = "/roomTypes/${roomType.getId()}";
        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'description': document.getElementById("description").value,
                'daily_price': document.getElementById("daily_price").value
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>
