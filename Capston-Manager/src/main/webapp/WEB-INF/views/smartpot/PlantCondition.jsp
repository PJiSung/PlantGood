<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="5;">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/temphumi.css" rel="stylesheet" type="text/css">
<title>식물 상태</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<style>
  table, th, td {
  text-align: center;
    border: 1px solid #bcbcbc;
  }
  table {
  table-layout: fixed;
    width: 510px;
  }
</style>

<style>

#btn {
	border: 1px solid blue;
	background-color: rgba(0, 0, 0, 0);
	color: blue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: -4px;
	height: 40px;
}

table {
	border-collapse: collapse;
	width: 520px;
}

table, td, th {
	border: solid 1px #cccccc;
}

tr {
	height: 40px;
	text-align: center;
}

td, th {
	padding: 5px;
}

.set1 {
	background-color: red;
	color: white;
	text-decoration: underline;
	font-weight: bold;
}

#c_head {
	height: 30px;
	background-color: #eeeeee;
}

#c_width {
	width: 500px;
}
</style>

</head>
<body>
<main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">

	<table border="1">
		<tr>
			<td>

				<input type="hidden" value="${reg3.rno}">
				<div class="image_wrap" data-rno="${reg3.imageList[0].rno}" data-path="${reg3.imageList[0].uploadPath}" data-uuid="${reg3.imageList[0].uuid}" data-filename="${reg3.imageList[0].fileName}">
					<center><img></center>
				</div>


			</td>
		</tr>
		<tr>
			<td>${reg.name}와함께한지 ${reg.day}일차입니다</td>
		</tr>
		<c:if test="${category eq '열매'}">
			<tr>
				<td>발아기</td>
				<td>성장기</td>
				<td>수확기</td>
			</tr>
		</c:if>
		<tr>
			<td>처음만난날</td>
		</tr>
		<tr>
			<td>${reg.regdate}</td>
		</tr>
	</table>
	
	<table>
			<tr id="c_head">
				<th>온도</th>
				<th>습도</th>
			</tr>
			<tr id="c_head">
				<th>
					<div style="width: 250px; height: 200px;">
						<canvas id="donut1"></canvas>
					</div>
				</th>
				<th>
					<div style="width: 250px; height: 200px;">
						<canvas id="donut2"></canvas>
					</div>
				</th>
			</tr>
			<tr>
				<td colspan=2>
					<div style="width: 500px;">
						<canvas id="line1"></canvas>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<button id="btn" onclick="location.href=window.location.href">REFRESH</button>
				</td>
			</tr>
		</table>
	
	<footer class="footer">
		<table>
			<th><a href="/smartpot/main"><img src="../resources/img/home.PNG"><br>Home</th>
			<th><a href="/smartpot/diary"><img src="../resources/img/diary.png"><br>Diary</th>
			<th><a href="/smartpot/controlpage"><img src="../resources/img/control.png"><br>Control</th>
			<th><a href="/shop/main"><img src="../resources/img/shop.png"><br>Shop</th>
		</table>
	</footer>
	</section>
	</main>

	
	<script>
	    var t_value = ${thlist.temperature};
		var t_color = "red";
		var num = (t_value + 50) / 100;
		var data = {
			labels : [ "온도" ],
			datasets : [ {
				data : [ num, 1 - num ],
				backgroundColor : [ t_color ],
				hoverBackgroundColor : [ t_color ]
			} ]
		};
		var ctx2 = document.getElementById('donut1').getContext('2d');
		var chart2 = new Chart(ctx2, {
			type : 'doughnut',
			data : data,
			options : {
				responsive : true,
				legend : {
					display : false
				},
				elements : {
					center : {
						text : Math.round(num * 100),
						fontStyle : 'Helvetica',
						sidePadding : 15
					}
				},
				maintainAspectRatio : false,
				cutoutPercentage : 70,
				animation : {
					onComplete : function() {
						ctx2.textAlign = 'center';
						ctx2.textBaseline = 'middle';
						ctx2.font = '50px Arial';
						ctx2.fillStyle = t_color;
						ctx2.fillText(t_value, chart2.width / 2,
								chart2.height - 70);
						ctx2.font = '20px Arial';
						ctx2.fillText("(℃)", chart2.width / 2,
								chart2.height - 40);
					}
				},
				rotation : 1 * Math.PI,
				circumference : 1 * Math.PI
			}
		});
		var h_value = ${thlist.humidity};
		var h_color = "blue";
		var num2 = h_value / 100;
		var data2 = {
			labels : [ "습도" ],
			datasets : [ {
				data : [ num2, 1 - num2 ],
				backgroundColor : [ h_color ],
				hoverBackgroundColor : [ h_color ]
			} ]
		};
		
		
		var ctx3 = document.getElementById('donut2').getContext('2d');
		var chart3 = new Chart(ctx3, {
			// 챠트 종류를 선택
			type : 'doughnut',
			data : data2,
			options : {
				responsive : true,
				legend : {
					display : false
				},
				elements : {
					center : {
						text : Math.round(num2 * 100),
						fontStyle : 'Helvetica',
						sidePadding : 15
					}
				},
				maintainAspectRatio : false,
				cutoutPercentage : 70,
				animation : {
					onComplete : function() {
						ctx3.textAlign = 'center';
						ctx3.textBaseline = 'middle';
						ctx3.font = '50px Arial';
						ctx3.fillStyle = h_color;
						ctx3.fillText(h_value, chart3.width / 2,
								chart3.height - 70);
						ctx3.font = '20px Arial';
						ctx3.fillText("(%)", chart3.width / 2,
								chart3.height - 40);
					}
				},
				rotation : 1 * Math.PI,
				circumference : 1 * Math.PI
			}
		});
		var temp = new Array(7);
		var humi = new Array(7);
		
		temp[6] = '${Tem[6]}';
		temp[5] = '${Tem[5]}';
		temp[4] = '${Tem[4]}';
		temp[3] = '${Tem[3]}';
		temp[2] = '${Tem[2]}';
		temp[1] = '${Tem[1]}';
		temp[0] = '${Tem[0]}';
		
		humi[6] = '${Hum[6]}';
		humi[5] = '${Hum[5]}';
		humi[4] = '${Hum[4]}';
		humi[3] = '${Hum[3]}';
		humi[2] = '${Hum[2]}';
		humi[1] = '${Hum[1]}';
		humi[0] = '${Hum[0]}';

		
		var ctx = document.getElementById('line1').getContext('2d');
		var chart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ '', '', '', '', '', '', '' ],
				datasets : [ {
					label : '온도',
					backgroundColor : 'transparent',
					borderColor : t_color,
					data : temp
				}, {
					label : '습도',
					backgroundColor : 'transparent',
					borderColor : h_color,
					data : humi
				} ]
			},
			options : {}
		});
	</script>
	
	<script>

$(document).ready(function(){
	
			
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("rno")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/smartpot/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.jpg');
		}
		
	});	
			
			
		}); 
</script>
</body>
</html>