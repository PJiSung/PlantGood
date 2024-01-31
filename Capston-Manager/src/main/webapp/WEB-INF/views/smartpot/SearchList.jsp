<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/searchlist.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>검색</title>
<style>

</style>
</head>
<body>
    <form action="searchlist" modelAttribute="searchVO" method="get">
    <div class="search"><fieldset><input type="search" id="keyword" name="keyword" placeholder="식물 검색하기"
			value="<%if (request.getParameter("keyword") != null) {
	out.print(request.getParameter("keyword"));
} else {
	out.print("");
}%>" /><button type="submit"><i class="fa fa-search"></i></button></fieldset></div>
    </form>
    
 <table>
	<c:forEach var="plant" items="${plant}" varStatus="status">
		<tr>
		<th onclick="location.href='plantinfo?pno=${plant.pno}'" style="cursor:pointer;border-bottom:1px solid #bcbcbc">
			<div class="box"><img class="plantimg" src="<c:url value='/resources/img/Plant/${plant.image}'/>" alt=""></div>
			<span class="imgtitle">${plant.kind}</span>
			<br>
		</th>
		</tr>
	</c:forEach>
	</table>
		
</body>
</html>