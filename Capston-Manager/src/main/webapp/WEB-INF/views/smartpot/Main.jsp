<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/temphumi.css" rel="stylesheet" type="text/css">
<title>식물 선택</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<style>
table, th, td {
  text-align: center;
    border: 1px solid #bcbcbc;
  }
  table {
  table-layout: fixed;
    width: 510px;
  }
.btn1 {
	position: absolute;
	top: 135px;
	left: 192px;
}
.btn2 {
	position: absolute;
	top: 135px;
	left: 452px;
}
.btn3 {
	position: absolute;
	top: 395px;
	left: 192px;
}
.btn4 {
	position: absolute;
	top: 395px;
	left: 452px;
}
.btn5 {
	position: absolute;
	top: 656px;
	left: 192px;
}
.btn6 {
	position: absolute;
	top: 656px;
	left: 452px;
}

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
	height: 250px;
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
<script type="text/javascript">
	function test() {
		var number;
		var text1 = "";
		var layout1 = document.getElementById("layout1");
		var layout2 = document.getElementById("layout2");
		var layout3 = document.getElementById("layout3");
		var layout4 = document.getElementById("layout4");
		var layout5 = document.getElementById("layout5");
		var layout6 = document.getElementById("layout6");
		var layout7 = document.getElementById("layout7");
		var lastnum = document.getElementById("lastnum");
		if (!lastnum) {
			number = 6;
		} else {
			number = 6 - lastnum.value;
		}
		text1 += "<div>이름</div><div><a href='select'><img src='../resources/img/addplant.png' width='200' height='200'></a></div>";
		if (number % 2 == 0) {
			layout7.style.display = "none";
		} else {
			layout7.innerHTML = text1;
		}
		switch (number) {
		case 0:
		case 1:
			layout1.style.display = "none";
			layout2.style.display = "none";
			layout3.style.display = "none";
			layout4.style.display = "none";
			layout5.style.display = "none";
			layout6.style.display = "none";
			break;
		case 2:
		case 3:
			layout1.innerHTML = text1;
			layout2.innerHTML = text1;
			layout3.style.display = "none";
			layout4.style.display = "none";
			layout5.style.display = "none";
			layout6.style.display = "none";
			break;
		case 4:
		case 5:
			layout1.innerHTML = text1;
			layout2.innerHTML = text1;
			layout3.innerHTML = text1;
			layout4.innerHTML = text1;
			layout5.style.display = "none";
			layout6.style.display = "none";
			break;
		case 6:
			layout1.innerHTML = text1;
			layout2.innerHTML = text1;
			layout3.innerHTML = text1;
			layout4.innerHTML = text1;
			layout5.innerHTML = text1;
			layout6.innerHTML = text1;
			break;
		}
	}
	
	function deleteplant(a){
		document.MainForm.rno.value=a;
		document.MainForm.action = 'deleteplant';
		document.MainForm.submit();
	}
</script>
</head>
<body onload="test()">
   
<form:form id="MainForm" name="MainForm" method="post">
<input type="hidden" id="rno" name="rno">
</form:form>
	<h1>Planty Good</h1>
	환영합니다! ${userName}님
	<br> 식물을 선택해주세요
	<table border="1">
		<tr style="display:none">
			<c:forEach var="reg" items="${reg}" varStatus="status">
				<c:if test="${status.index % 2 == 0}">
		</tr>
		<tr>
			</c:if>
			<th>${reg.name}
				<div id="test">
					<div class="image_wrap" data-rno="${reg.imageList[0].rno}" data-path="${reg.imageList[0].uploadPath}" data-uuid="${reg.imageList[0].uuid}" data-filename="${reg.imageList[0].fileName}">
						<a href="condition?name=${reg.name}&kind=${reg.kind}&rno=${reg.rno}&memberid=${memberid}">
						<img border="1px solid black" style="width:200px;height:200px" class="loadImg"></a>
					</div>
					<input type="button" class="btn${status.count}" value="삭제" onclick="deleteplant('${reg.rno}')">
				</div> 
				<c:if test="${status.last}">
					<input type="hidden" name="lastnum" id="lastnum" value=${status.count}>
				</c:if>
			</th>
			</c:forEach>
			<th id="layout7"></th>
		</tr>
		<tr>
			<th id="layout1"></th>
			<th id="layout2"></th>
		</tr>
		<tr>
			<th id="layout3"></th>
			<th id="layout4"></th>
		</tr>
		<tr>
			<th id="layout5"></th>
			<th id="layout6"></th>
		</tr>
	</table>
	
	</section>
	</main>

	<script>
		$(document)
				.ready(
						function() {

							/* 이미지 삽입 */
							$(".image_wrap")
									.each(
											function(i, obj) {

												const bobj = $(obj);

												if (bobj.data("rno")) {
													const uploadPath = bobj
															.data("path");
													const uuid = bobj
															.data("uuid");
													const fileName = bobj
															.data("filename");

													const fileCallPath = encodeURIComponent(uploadPath
															+ "/s_"
															+ uuid
															+ "_" + fileName);

													$(this)
															.find("img")
															.attr(
																	'src',
																	'/smartpot/display?fileName='
																			+ fileCallPath);
												} else {
													$(this)
															.find("img")
															.attr('src',
																	'/resources/img/goodsNoImage.jpg');
												}
											});
						});
	</script>



</body>
</html>