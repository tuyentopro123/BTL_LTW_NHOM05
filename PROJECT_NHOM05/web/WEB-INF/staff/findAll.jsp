<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Staff</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1>Danh sách nhân viên</h1>
    <div class="over">
        <table>
            <thead>
                <tr><th>Tên</th><th>Quyền hạn</th><th>Tên đăng nhập</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${staffList}" var="staff">
                <tr onclick="window.location.href='/staff/${staff.getId()}';">
                	<td>${staff.getName()}</td>
                	<td>
						<c:if test="${staff.getAccessLevel() == 'STAFF'}">
							Nhân viên
						</c:if>
						<c:if test="${staff.getAccessLevel() == 'OWNER'}">
							Admin
						</c:if>
					</td>
                	<td>${staff.getLogin()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    </table>
    <div class="submit">
        <button onclick="window.location.href='/staff/new';">Nhân viên mới</button>
    </div>
</div>


<script>
    function link(id) {
        console.log(id);
        let url = "/staff/"+ id;

        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/staff" });
    }
</script>
</html>

