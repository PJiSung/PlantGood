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
    <link rel="stylesheet" href="../resources/css/manager/orderMain.css?">
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	function selectedOptionCheck() {
		$("#type > option[value=${param.type}]").attr("selected", "true");
	}
	
	function checkSelectAll()  {
		  const checkboxes 
		    = document.querySelectorAll('input[name="delete"]');
		  const checked 
		    = document.querySelectorAll('input[name="delete"]:checked');
		  const selectAll 
		    = document.querySelector('input[name="selectall"]');
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }
		}
	
		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('delete');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
		
	function fnCmdDelete() {
		document.OrderForm.action = 'deleteorder';
		document.OrderForm.submit();
	}
	
	function cleartext(){
		document.getElementById("keyword").value="";
	}
	
	function moveAction(where){
		switch (where) {
			case 1:
			location.href = "account";
			break;
		}
	}
	
	function modify(recordNo,orderno){
			var order=document.getElementById(recordNo);
			document.OrderForm.orderno.value=parseInt(orderno);
			document.OrderForm.ono.value = recordNo;
			document.OrderForm.action = 'processingmodify';
			document.OrderForm.orderstate.value=order.options[order.selectedIndex].value;
			document.OrderForm.submit();
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
          <!-- 주문 관리 -->
          <!-- ============================================================== -->
          	<div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>주문 관리</span>
		</div>
		<div class="manager_content_main">

			<div class="goods_table_wrap">

				<form action="order" modelAttribute="searchVO" method="get">
					<select id="type" name="type">
						<option value="orderno">주문번호</option>
						<option value="name">주문자명</option>
						<option value="kitname">상품명</option>
					</select> <input type="search" id="keyword" name="keyword"
						value="<%if (request.getParameter("keyword") != null) {
									out.print(request.getParameter("keyword"));
								} else {
									out.print("");
								}%>" />
					
					<input type="submit" value="검색" class="w-btn w-btn-blue" />
				</form>
				<form:form id="OrderForm" name="OrderForm" method="post">
					<input type="hidden" name="ono" />
					<input type="hidden" name="colno" />
					<input type="hidden" name="orderstate" />
					<input type="hidden" name="orderno" />
					<table class="goods_table">
						<thead>
							<tr>
								<c:forEach var="order" items="${ordercnt}" varStatus="status">
									<th colspan='9'>전체 주문(${order.totalcnt})</th>
								</c:forEach>
							</tr>
							<tr>
								<th style="border-top:1px solid #d3d8e1"><input type="checkbox" name="selectall"
									value="selectall" onclick="selectAll(this)"></th>

								<td class="th_column_4">주문일</td>
								<td class="th_column_1">주문번호</td>
								<td class="th_column_1">주문자명</td>
								<td class="th_column_4">상품명</td>
								<td class="th_column_1">주문수량</td>
								<td class="th_column_1">주문금액</td>
								<td class="th_column_1">처리상태</td>
								<td class="th_column_1"></td>
							</tr>
						</thead>
						<c:forEach var="order" items="${order}" varStatus="status">
							<tr onclick="location.href='orderinfo?ono=${order.ono}'" style="cursor:pointer">
								<td onclick="event.cancelBubble=true" style="cursor:default"><input type="checkbox" name="delete"
									value="${order.ono}" onclick="checkSelectAll()"></td>

								<td><c:out value="${order.regdate}"></c:out></td>
								<td><c:out
											value="${order.orderno}"></c:out></td>
								<td><c:out
											value="${order.name}"></c:out></td>
								<td><c:out value="${order.kitname}"></c:out></td>
								<td><c:out value="${order.kitstock}"></c:out></td>
								<td><c:out value="${order.totalcost}"></c:out></td>


								<td onclick="event.cancelBubble=true" style="cursor:default">
								<select id="${order.ono}" name="${order.ono}">
										<option value="주문접수"
											<c:if test="${order.orderstate eq '주문접수'}">selected</c:if>>주문접수</option>
										<option value="결제완료"
											<c:if test="${order.orderstate eq '결제완료'}">selected</c:if>>결제완료</option>
										<option value="배송완료"
											<c:if test="${order.orderstate eq '배송완료'}">selected</c:if>>배송완료</option>
										<option value="주문취소"
											<c:if test="${order.orderstate eq '주문취소'}">selected</c:if>>주문취소</option>
								</select></td>
								
								<th onclick="event.cancelBubble=true" style="border-bottom:1px solid #d3d8e1;cursor:default">
								<input type="button" id="btn" name="btn" value="수정"
									onclick="modify('${order.ono}','${order.orderno}')" class="w-btn w-btn-blue">
								</th>

							</tr>
						</c:forEach>
					</table>
					<input type="button" value="선택 삭제" onclick="fnCmdDelete()"
						class="w-btn w-btn-blue">
				</form:form>
				<br>${pageHttp} <br> <br>

			</div>
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
