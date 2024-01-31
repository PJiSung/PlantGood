<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
 
    <meta name="robots" content="noindex,nofollow" />
    <title>관리자 페이지</title>
	<link rel="stylesheet" href="../resources/css/manager/Main.css?string">
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/resources/img/logo.png"
    />
    <!-- Custom CSS -->
    <link href="/resources/assets/libs/flot/css/float-chart.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="/resources/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>

  <body>

   <%@include file="../includes/ManagerHeader.jsp"%>
	<input type="hidden" id="test" value="test">
      <div class="page-wrapper">
      <div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>관리자 메인<a href="/Manager/index">(차트표)</a></span>
		</div>
		<div class="goods_table_wrap">
			<form:form id="MainForm" name="MainForm" method="post">
				
				<br>
				<table border="1" class="goods_table">
					<thead>
						<tr>
							<th colspan='6'>일자별 요약</th>
						</tr>
						<tr>
							<th>일자</th>
							<th>주문수</th>
							<th>매출액</th>
							<th>방문자수</th>
							<th>가입자수</th>
							<th>문의수</th>
						</tr>
					</thead>
					<c:forEach var="manager" items="${main}" varStatus="status">
						<tr>
							<td>${manager.regDate}</td>
							<td>${manager.ordercnt}</td>
							<td>${manager.take}원</td>
							<td>${manager.visitcnt}</td>
							<td>${manager.joincnt}</td>
							<td>${manager.inquirycnt}</td>
						</tr>
					</c:forEach>
					<thead>
						<tr>
							<td>최근 7일 합계</td>
							<c:forEach var="manager" items="${order7}" varStatus="status">
								<td>${manager.ordercnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${take7}" varStatus="status">
								<td>${manager.take}원</td>
							</c:forEach>
							<c:forEach var="manager" items="${visitcnt7}" varStatus="status">
								<td>${manager.visitcnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${joincnt7}" varStatus="status">
								<td>${manager.joincnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${inquirycnt7}"
								varStatus="status">
								<td>${manager.inquirycnt}</td>
							</c:forEach>
						</tr>
						<tr>
							<td>이번달 합계</td>
							<c:forEach var="manager" items="${order30}" varStatus="status">
								<td>${manager.ordercnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${take30}" varStatus="status">
								<td>${manager.take}원</td>
							</c:forEach>
							<c:forEach var="manager" items="${visitcnt30}" varStatus="status">
								<td>${manager.visitcnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${joincnt30}" varStatus="status">
								<td>${manager.joincnt}</td>
							</c:forEach>
							<c:forEach var="manager" items="${inquirycnt30}"
								varStatus="status">
								<td>${manager.inquirycnt}</td>
							</c:forEach>
						</tr>
						</thead>
					</table>
				</form:form>
			</div>
				
		</div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="/resources/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="/resources/dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="/resources/assets/libs/flot/excanvas.js"></script>
    <script src="/resources/assets/libs/flot/jquery.flot.js"></script>
    <script src="/resources/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="/resources/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="/resources/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="/resources/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="/resources/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="/resources/dist/js/pages/chart/chart-page-init.js"></script>

  </body>
</html>
