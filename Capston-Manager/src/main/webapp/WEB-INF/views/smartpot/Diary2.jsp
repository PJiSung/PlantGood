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
<link href="${pageContext.request.contextPath}/resources/css/smartpot/diary.css" rel="stylesheet" type="text/css">
<title>Diary</title>
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
	function fnCmdNew(regdate, name, count) {
		document.AccountForm.regdate.value = regdate;
		document.AccountForm.name.value = name;
		document.AccountForm.count.value = count;
		document.AccountForm.action = 'daylist';
		document.AccountForm.submit();
	}
	
	function loadDay(){
		var day = ${count};
		var checkoption = document.getElementById("option"+day);
		checkoption.className="checkoption option-"+day;
		document.body.scrollLeft=10000;
	}
</script>

</head>
<body onload="loadDay()">
<div class="contain">
	<form:form id="AccountForm" name="AccountForm" method="post">
		<input type="hidden" id="regdate" name="regdate">
		<input type="hidden" id="name" name="name">
		<input type="hidden" id="count" name="count">
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
				<td>${reg.name}</td>
			</tr>
			<tr>
				<td>${reg.kind} > | ${reg.regdate} 시작</td>
			</tr>
		</table>
		<div class="wrapper">
		<c:forEach var="diarylist" items="${diarylist}" varStatus="status">
		
				<input type="radio" name="payment" id="option-${status.count}" onclick="fnCmdNew('${diarylist.regdate}','${reg.name}','${status.count}')">
				<label for="option-${status.count}" id="option${status.count}" class="option option-${status.count}"> <span>Day${diarylist.day}</span></label>
				
				<c:if test="${status.last}">
					<input type="hidden" name="lastnum" id="lastnum" value=${status.count}>
				</c:if>
		</c:forEach>
		</div>
	</form:form>
	<div class="diary">
	<c:forEach var="diaryinfo" items="${diaryinfo}" varStatus="status">
		<span class="time">${diaryinfo.regdate}</span> <div class="circle"></div> <span class="contents">${diaryinfo.contents}</span>
	<br>
	<br>
	</c:forEach>
	</div>
	</div>
	
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