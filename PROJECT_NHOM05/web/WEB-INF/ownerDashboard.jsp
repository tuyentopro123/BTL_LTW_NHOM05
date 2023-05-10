<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/js/Chart.min.js"></script>
<div class="content">

    <h1 id="today"></h1>

    <div id="revenues">
        <h2>Doanh thu</h2>
        <div class="property" style="grid-area: 2/1/3/2;">
            <span class="label">Theo năm</span>
            <span class="data"><span id="yearRevenues"></span> VNĐ</span>
        </div>

        <div class="property" style="grid-area: 2/2/3/3;">
            <span class="label">Theo tuần</span>
            <span class="data"><span id="weekRevenues"></span> VNĐ</span>
        </div>
        <div class="property" style="grid-area: 3/1/4/2;">
            <span class="label">Theo tháng</span>
            <span class="data"><span id="monthRevenues"></span> VNĐ</span>
        </div>
        <div class="property" style="grid-area: 3/2/4/3;">
            <span class="label">theo ngày</span>
            <span class="data"><span id="dayRevenues"></span> VNĐ</span>
        </div>
    </div>
    <div id="checks">
        <h2>Hôm nay</h2>
        <div class="property" style="grid-area: 2/1/3/2;">
            <span class="label">Dự kiến nhận phòng</span>
            <span class="data"><span id="expectedArrives"></span></span>
        </div>
        <div class="property" style="grid-area: 2/2/3/3;">
            <span class="label">Dự kiến rời đi</span>
            <span class="data"><span id="expectedDepartures"></span></span>
        </div>

    </div>
    <div id="rooms">
        <h2>Tình hình hiện tại của khách sạn</h2>
        <div class="property" style="grid-area: 2/1/3/2;">
            <span class="label">Đã đặt trước</span>
            <span class="data"><span id="bookedRooms"></span></span>
        </div>
        <div class="property" style="grid-area: 2/2/3/3;">
            <span class="label">Đã được đặt</span>
            <span class="data"><span id="occupiedRooms"></span></span>
        </div>
        <div class="property" style="grid-area: 2/3/3/4;">
            <span class="label">Còn trống</span>
            <span class="data"><span id="availableRooms"></span></span>
        </div>
        <div class="property" style="grid-area: 2/4/3/5;">
            <span class="label">Tổng</span>
            <span class="data"><span id="totalRooms"></span></span>
        </div>
    </div>


</div>

<script>
    let today = document.getElementById("today");

    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    let now = new Date();
    let dateNow = "Hôm nay " + now.getDate() + "/" + (now.getMonth() + 1)  + "/" + now.getFullYear();
    today.innerText = dateNow;

    let hoursToMidnight = 24 - now.getHours();
    let minutesToNextHour = 60 - now.getMinutes();
    let secondsToNextMinute = 60 - now.getSeconds();

    let minutesToMidnight = (hoursToMidnight * 60) + minutesToNextHour;

    let secondsToMidnight = (minutesToMidnight * 60) + secondsToNextMinute;

    let millisecondsToMidnight = secondsToMidnight * 1000;

    setTimeout(function () {
        window.location.reload();
    }, millisecondsToMidnight)
	function formatNumberWithDot(value) {
	  return value.toLocaleString('vi-VN');
	}

    let url = "/api/ownerDashboard";
    fetch(url, {method: 'GET'})
        .then(response => response.json())
        .then(data => {
			console.log(data)
            let weekRevenuesDetailed = Object.values(data.weekRevenuesDetailed);

            document.getElementById("yearRevenues").innerHTML = formatNumberWithDot(data.yearRevenues);
            document.getElementById("monthRevenues").innerHTML = formatNumberWithDot(data.monthRevenues);
            document.getElementById("weekRevenues").innerHTML = formatNumberWithDot(data.weekRevenues);
            document.getElementById("dayRevenues").innerHTML = formatNumberWithDot(weekRevenuesDetailed[0]);

            document.getElementById("expectedArrives").innerHTML = data.todayArrives;
            document.getElementById("expectedDepartures").innerHTML = data.todayDepartures;
			document.getElementById("bookedRooms").innerHTML = data.bookedRooms;
            document.getElementById("occupiedRooms").innerHTML = data.occupiedRooms;
            document.getElementById("availableRooms").innerHTML = data.availableRooms;
            document.getElementById("totalRooms").innerHTML = data.totalRooms;

            let trendindRoomsQuantity = Object.values(data.trendingRooms);
            let trendindRoomsName = Object.keys(data.trendingRooms);
            let colorsTrendingRooms = colors.flat(data.trendingRooms.length)

            let labelsRevenue = Object.keys(data.weekRevenuesDetailed);
            labelsRevenue.reverse();
            let valuesRevenues = Object.values(data.weekRevenuesDetailed);
            valuesRevenues.reverse();
        });


</script>