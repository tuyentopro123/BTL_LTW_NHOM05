<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Guests</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1>Danh sách khách hành</h1>
    <div class="over">
        <table>
            <thead>
                <tr>
                	<th>Tên khách hàng</th>
                	<th>Địa chỉ</th>
                	<th>Ngày sinh</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${guestList}" var="guest">
                    <tr onclick="window.location.href='/guests/${guest.getId()}';"><td>${guest.getName()}</td><td>${guest.getDocument()}</td><td>${guest.getBirthDate()}</td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="submit">
        <button onclick="window.location.href='/guests/new';">Khách hàng mới</button>
    </div>
</div>
</body>

</html>