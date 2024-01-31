<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/temphumi.css" rel="stylesheet" type="text/css">
<title>온습도</title>

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



<script type="text/javascript">
function tempdata() {
	document.tempform.action = 'send';
	document.tempform.submit();
}
function Whether(value){
	location.href="ControlWhether?control="+value+"&rno="+${reg3.rno};
	location.href="sendcontrol?control="+value;
	location.href="send?control="+value;
}

function autotempdata(kind){
	location.href="sendauto?kind="+kind;
}

function is_checked(id){
	var checkbox = document.getElementById(id);
	var checked = checkbox.checked;
	
	if(id == "ledbox"){
		if(checked == true){
			location.href="LedWhether?led=on";
			document.ledsend.on.value="on";
			document.ledsend.test.value="on";
		}else{
			location.href="LedWhether?led=off";
			document.ledsend.off.value="off";
			document.ledsend.test.value="off";
		}
	document.ledsend.submit();
	}else{
		
		if(checked == true){
			location.href="PumpWhether?pump=on";
			document.watersend.on.value="on";
		}else{
			location.href="PumpWhether?pump=off";
			document.watersend.off.value="off";
		}
	document.watersend.submit();	
	}
}
</script>
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
			<th>
			제어모드
			<input type="radio" id="manual" name="Whether" checked <c:if test="${control eq 'manual'}"> checked </c:if>>
			<label for="manual" id="manual" onclick="Whether(this.id)">수동</label>
			<input type="radio" id="auto" name="Whether" <c:if test="${control eq 'auto'}"> checked </c:if>>
			<label for="auto" id="auto" onclick="Whether(this.id);autotempdata('${reg3.kind}');">자동</label>
			</th>
			
		</tr>
		
		</table>
		<form name="tempform">
		<table>
		<tr>
		<td>
		<div class="mobile-login_cell__body">
			<input name="memberiddata" value="${reg3.memberid}" type="hidden" class="input-field"/>
			<input name="namedata" value="${reg3.name}" type="hidden" class="input-field"/>
            <input name="temmin" type="text" class="input-field" placeholder="최소온도" <c:if test="${control eq 'auto'}">value="${plant.temmin}" disabled</c:if>/> 
            <input name="temmax" type="text" class="input-field" placeholder="최대온도" <c:if test="${control eq 'auto'}">value="${plant.temmax}" disabled</c:if>/> 
            <input type="hidden" name="control" value="${control}">
        </div>

		<c:choose>
		<c:when test="${control eq 'auto'}"><input type="button" id="send" class="sendbtn" value="제어" disabled></c:when>
		<c:when test="${control eq 'manual'}"><input type="button" id="send" class="btn btn-go" onclick="tempdata()" value="제어"></c:when>
		<c:otherwise><input type="button" id="send" class="btn btn-go" onclick="tempdata()" value="제어"></c:otherwise>
		</c:choose>

		</td>
		</tr>
		</table>
		</form>

		
		<table border="1">
		<tr>
			<td>
				<form action="ledsend" name="ledsend">
				LED
				<input name="memberiddata" value="${reg3.memberid}" type="hidden" class="input-field"/>
				<input name="namedata" value="${reg3.name}" type="hidden" class="input-field"/>
								<input type="hidden" name="on" id="on">
								<input type="hidden" name="off" id="off">
								<input type="hidden" name="test" id="test">
				
				<center>
				<label class="switch">
					  	<c:choose>
						<c:when test="${led eq 'on'}"><input type="checkbox" id="ledbox" class="ledbox" onclick="is_checked(this.id)" checked></c:when>
						<c:otherwise><input type="checkbox" id="ledbox" class="ledbox" onclick="is_checked(this.id)"></c:otherwise>
						</c:choose>
					  <span class="slider round"></span>
					</label>
					<c:choose>
						<c:when test="${led eq 'on'}">
						<p class="ledoff">ON</p>
					    <p class="ledon" style="display:none;">OFF</p>
						</c:when>
						<c:otherwise>
						<p class="ledoff">OFF</p>
					    <p class="ledon" style="display:none;">ON</p>
						</c:otherwise>
					</c:choose>
				</center>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="watersend" name="watersend">
				물주기
				<input name="memberiddata" value="${reg3.memberid}" type="hidden" class="input-field"/>
				<input name="namedata" value="${reg3.name}" type="hidden" class="input-field"/>
				<input type="hidden" name="on" id="on">
				<input type="hidden" name="off" id="off">
				
				
				<center>
				<label class="switch">
					  	<c:choose>
						<c:when test="${pump eq 'on'}"><input type="checkbox" id="pumpbox" class="pumpbox" onclick="is_checked(this.id)" checked></c:when>
						<c:otherwise><input type="checkbox" id="pumpbox" class="pumpbox" onclick="is_checked(this.id)"></c:otherwise>
						</c:choose>
					  <span class="slider round"></span>
					</label>
					
					<c:choose>
						<c:when test="${pump eq 'on'}">
						<p class="pumpoff">ON</p>
					    <p class="pumpon" style="display:none;">OFF</p>
						</c:when>
						<c:otherwise>
						<p class="pumpoff">OFF</p>
					    <p class="pumpon" style="display:none;">ON</p>
						</c:otherwise>
					</c:choose>
					
					
					
				</center>
				</form>
			</td>
		</tr>
		</table>
		
		<br>
		<br>
		<br>
		
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
	var check = $("input[type='checkbox'].ledbox");
	check.click(function(){
		$("p.ledoff").toggle();
	  $("p.ledon").toggle();
	});

	var check2 = $("input[type='checkbox'].pumpbox");
	check2.click(function(){
		$("p.pumpoff").toggle();
	  $("p.pumpon").toggle();
	});

	
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