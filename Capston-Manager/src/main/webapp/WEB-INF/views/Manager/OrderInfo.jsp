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
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template"
    />
    <meta
      name="description"
      content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>주문 관리</title>
	<link rel="stylesheet" href="../resources/css/manager/orderInfo.css?string">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
	<script type="text/javascript">
		function moveAction(where) {
			switch (where) {
			case 1:
				location.href = "order";
				break;
			}
		}
		function replaceDate(date){
			document.getElementById("senddate").value = date.re placeAll("-","/");
		} 
	</script>
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
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <%@include file="../includes/ManagerHeader.jsp"%>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
          <!-- ============================================================== -->
          <!-- 주문 관리-->
          <!-- ============================================================== -->
        <div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>주문 관리</span>
		</div>
		<form action="ordermodify" id="abc" method="post"
			enctype="multipart/form-data">

			<div class="goods_table_wrap">
				<h3>주문 정보</h3>
				<table class="goods_table">
					<tr>
						<th>상품명</th>
						<td colspan="3">${order.kitname}</td>
					</tr>
					<tr>
						<th>주문수량<input type="hidden" id="ono" name="ono"
							value="${order.ono}"></th>
						<td>${order.kitstock}</td>
						<th>금 액</th>
						<td>${order.totalcost}</td>
					</tr>
					<tr>
						<th>주문정보</th>
						<td>${order.orderno}</td>
						<th>처리상태</th>
						<td>${order.orderstate}</td>
					</tr>
					<tr>
						<th>주문일자</th>
						<td colspan='3'>${order.regdate}</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>${order.payment}</td>
						<th>입금계좌</th>
						<td>${order.bankname}</td>
					</tr>
					<tr>
						<th>운송장번호</th>
						<td><input type="text" id="waybilno" name="waybilno"
							value="${order.waybilno}"></td>
						<th>발송일자</th>
						<td><input class="inputdate" type="date" id="start" name="senddate" value="" min="2022-01-01" max="2022-12-31" onchange="replaceDate(this.value)">
						<input type="hidden" id="senddate" name="senddate"></td>
					</tr>
					<tr>
						<th rowspan="2">처리시간</th>
						<th colspan="3"><table border="1" class="goods_table1">
								<tr>
									<th>주문접수</th>
									<th>결제완료</th>
									<th>배송완료</th>
									<th>주문취소</th>
								</tr>
								<tr>
									<td>${processing.reception}</td>
									<td>${processing.paymentcom}</td>
									<td>${processing.deliverycom}</td>
									<td>${processing.cancel}</td>
								</tr>
							</table></th>
					</tr>
				</table>
			</div>
			<div class="goods_table_wrap">
				<h3>주문자 정보</h3>
				<table class="goods_table">
					<tr>
						<th>주문자명</th>
						<td>${orderer.name}</td>
						<th>이메일</th>
						<td>${orderer.email}</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>${orderer.phone}</td>
						<th>우편번호</th>
						<td>${orderer.zip}</td>
					</tr>
					<tr>
						<th rowspan="2">주소</th>
						<td>${orderer.addr1}</td>
					</tr>
					<tr>
						<td>${orderer.addr2}</td>
					</tr>
				</table>
			</div>

			<div class="goods_table_wrap">
				<h3>수취인 정보</h3>
				<table class="goods_table">
					<tr>
						<th>수취인명</th>
						<td>${reciever.name}</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>${reciever.phone}</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${reciever.zip}</td>
					</tr>
					<tr>
						<th rowspan="2">주소</th>
						<td>${reciever.addr1}</td>
					</tr>
					<tr>
						<td>${reciever.addr2}</td>
					</tr>
					<tr>
						<th>주문취소 사유</th>
						<td><input type="text" id="cancelreason" name="cancelreason"
							value="${reciever.cancelreason}"></td>
					</tr>
					<tr>
						<th>관리자 메모</th>
						<td><input type="text" id="memo" name="memo"
							value="${reciever.memo}"></td>
					</tr>
				</table>
			</div>
			<div class="btn_section">
				<input type="button" value="뒤로" class="w-btn w-btn-blue"
					onclick="moveAction(1)" /> <input type="submit" value="저장"
					class="w-btn w-btn-blue" />
			</div>
		</form>
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
