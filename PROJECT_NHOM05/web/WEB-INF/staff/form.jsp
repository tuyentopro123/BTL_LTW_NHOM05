<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Staff</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/staff" id="form" <c:if test="${staff == null}">method="POST" </c:if> >
        <h1><c:choose><c:when test="${staff == null}"></c:when><c:otherwise>Edit</c:otherwise></c:choose> nhân viên</h1>
        <label for="name">Tên họ</label>
        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus" required value="${staff.getName()}" required>
        <label for="access_level">quyền hạn</label>
        <select name="access_level" id="access_level" required>
            <option disabled selected value></option>
            <c:forEach items="${accessLevelList}" var="accessLevel">
                <option value="${accessLevel}" <c:if test="${accessLevel == staff.getAccessLevel()}"> selected </c:if>>${accessLevel}</option>
            </c:forEach>
        </select>
        <label for="login">Tài khoản</label>
        <input type="text" name="login" id="login" required autocomplete="off" value="${staff.getLogin()}" required>
        <label for="password">Mật khẩu</label>
        <input type="password" required name="password" id="password" autocomplete="off" value="${staff.getPassword()}" required>
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
        let url = "/staff/${staff.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'access_level': document.getElementById("access_level").value,
                'login': document.getElementById("login").value,
                'password': document.getElementById("password").value
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>

