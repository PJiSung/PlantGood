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
<link href="${pageContext.request.contextPath}/resources/css/smartpot/plantinfo.css" rel="stylesheet" type="text/css">
<title>식물 선택</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script>
	function moveAction(where){
		switch (where) {
			case 1:
			location.href = "ragistration?pno=${plant.pno}";
			break;
		}
	}
</script>

</head>
<body>
<!--  <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">-->
    
	<center>    <form action="searchlist" modelAttribute="searchVO" method="get">
    <div class="search"><fieldset><input type="search" id="keyword" name="keyword" placeholder="식물 검색하기"
			value="<%if (request.getParameter("keyword") != null) {
	out.print(request.getParameter("keyword"));
} else {
	out.print("");
}%>" /><button type="submit"><i class="fa fa-search"></i></button></fieldset></div>
    </form></center>
    
	<table>	
			<tr>
				<td><h3>${plant.kind}</h3></td>
			</tr>
			<tr>
				<td><img src="<c:url value='/resources/img/Plant/${plant.image}'/>" width="400" height="200" alt=""></td>
			</tr>
			<tr>
				<td><span style="font-weight:bold">상세설명</span></td>
			</tr>
			<tr>
				<td>${plant.contents}</td>
			</tr>
	</table>
	<center><input type="button" class="btn btn-go" value="식물 선택" onclick="moveAction(1)"></center>
</section>
</main>
</body>
</html>