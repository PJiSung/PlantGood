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

<link href="${pageContext.request.contextPath}/resources/css/smartpot/plantlist.css" rel="stylesheet" type="text/css">
<title>식물 선택</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
table, th, td {
  text-align: center;
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
	width: 384px;
}

table, td, th {
	height: 140px;
}

tr {
	height: 40px;
	text-align: center;
}

td, th {
	padding: 5px;
	font-size: 15pt;
	font-weight: bold;
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
.box{
	width:125px;
	height:125px;
	border-radius:20%;
	overflow:hidden;
	float:left;
}
.plantimg{
	width:100%;
	height:100%;
	object-fit:cover;
}
.imgtitle{
	float:left;
}
</style>
</head>
<body>
<!-- <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con"> -->
    
	<center>    <form action="searchlist" modelAttribute="searchVO" method="get">
    <div class="search"><fieldset><input type="search" id="keyword" name="keyword" placeholder="식물 검색하기"
			value="<%if (request.getParameter("keyword") != null) {
	out.print(request.getParameter("keyword"));
} else {
	out.print("");
}%>" /><button type="submit"><i class="fa fa-search"></i></button></fieldset></div>
    </form></center>
    
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
	</section>
	</main>
</body>
</html>