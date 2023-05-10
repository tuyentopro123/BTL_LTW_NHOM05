<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Loại phòng</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1>Danh sách loại phòng</h1>
    <div class="over">
        <table>
            <thead>
                <tr>
                	<th>Tên</th>
                	<th>Mô tả</th>
                	<th>VNĐ/ngày</th>
        		</tr>
            </thead>
            <tbody>
            <c:forEach items="${roomTypeList}" var="roomType">
                <tr onclick="window.location.href='/roomTypes/${roomType.getId()}';">
                	<td>${roomType.getName()}</td>
                	<td>${roomType.getDescription()}</td>
                	<td>
                		<fmt:formatNumber value="${roomType.getDailyPrice()}" pattern="###,### VNĐ"/>
                	</td>
 
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    </table>
    <c:if test="${allowed == true}">
    <div class="submit">
        <button onclick="window.location.href='/roomTypes/new';">Loại phòng mới</button>
    </div>
    </c:if>
</div>

</body>
<script>
    document.getElementById("departure").oninput = function () {
        let rts = document.querySelectorAll(".count");
        if(validate()){
            if((document.getElementById("departure").value !== "") && (document.getElementById("arrival").value !== "")){
                let url = "/api/count?arrival="+ document.getElementById("arrival").value + "&departure=" + document.getElementById("departure").value;
                fetch(url, {
                    method: 'GET',
                }).then(resp => resp.json())
                    .then(data => {
                        let i = 0;
                        for(let x of rts){
                            x.innerHTML = data[i].count;
                            i++;
                        }
                    });
            }
        }else{
            for(let x of rts){
                x.innerHTML= '-';
            }
        }
    }

    document.getElementById("arrival").oninput = function () {
        let rts = document.querySelectorAll(".count");
        if(validate()){
            if ((document.getElementById("departure").value !== "") && (document.getElementById("arrival").value !== "")) {
                let url = "/api/count?arrival="+ document.getElementById("arrival").value + "&departure=" + document.getElementById("departure").value;
                fetch(url, {
                    method: 'GET',
                }).then(resp => resp.json())
                    .then(data => {
                        for (let i=0; i<data.length; i++) {
                            for(let x of rts){
                                x.innerHTML = data[i].count;
                            }
                        }
                    });
            }
        }else{
            for(let x of rts){
                x.innerHTML= '-';
            }
        }
    }

    function validate() {
        if(document.getElementById("arrival").value >= document.getElementById("departure").value){
            document.getElementById("arrival").setCustomValidity("Date start is bigger than date end.");
            return false;
        }else{
            document.getElementById("arrival").setCustomValidity("");
            return true;
        }
    }
</script>
</html>
