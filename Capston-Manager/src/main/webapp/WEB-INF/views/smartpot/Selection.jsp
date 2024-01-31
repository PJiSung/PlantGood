<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/selection.css" rel="stylesheet" type="text/css">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/temphumi.css" rel="stylesheet" type="text/css">
<title>식물 선택</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
<!--  <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">-->
    
    <form action="searchlist" modelAttribute="searchVO" method="get">
    <div class="search"><fieldset><input type="search" id="keyword" name="keyword" placeholder="식물 검색하기"
			value="<%if (request.getParameter("keyword") != null) { 
	out.print(request.getParameter("keyword"));
} else {
	out.print("");
}%>" /><button type="submit"><i class="fa fa-search"></i></button></fieldset></div>
    </form>
    
	<table border="1">
		<tr>
			<td><div class="subpic"><a href="plantlist?category=열매"><img src="<c:url value='/resources/img/열매.PNG'/>" height="140px" alt=""><span class="imtext">열매</span></a></div></td>
			<td><div class="subpic"><a href="plantlist?category=허브"><img src="<c:url value='/resources/img/허브.jpg'/>" height="140px" width="140px" alt=""><span class="imtext">허브</span></a></div></td>
		</tr>
		<tr>
			<td><div class="subpic"><a href="plantlist?category=나무"><img src="<c:url value='/resources/img/나무.jpg'/>" height="140px" alt=""><span class="imtext">나무</span></a></div></td>
			<td><div class="subpic"><a href="plantlist?category=선인장"><img src="<c:url value='/resources/img/선인장.PNG'/>" height="140px" alt=""><span class="imtext">선인장</span></a></div></td>
		</tr>
		<tr>
			<td><div class="subpic"><a href="plantlist?category=꽃"><img src="<c:url value='/resources/img/꽃.png'/>" height="140px" alt=""><span class="imtext">꽃</span></a></div></td>
			<td><div class="subpic"><a href="plantlist?category=무늬"><img src="<c:url value='/resources/img/무늬.png'/>" height="140px" alt=""><span class="imtext">무늬</span></a></div></td>
		</tr>
	</table>
	</section>
	</main>
</body>
</html>