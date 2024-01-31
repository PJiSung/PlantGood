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
    <title>결제 설정</title>
    <link rel="stylesheet" href="../resources/css/manager/account.css?">
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script type="text/javascript">
		function modifyAccount(recordNo) {
			var btn = document.getElementById("btn");
			if (btn.value == "수정") {
				var editbankname = document.getElementById("editbankname"
						+ recordNo);
				var tablebankname = document.getElementById("tablebankname"
						+ recordNo).value;
				editbankname.innerHTML = "<input type='text' id='bankname' name='bankname' value='"+tablebankname+"'>";
	
				var editaccount = document.getElementById("editaccount" + recordNo);
				var tableaccount = document.getElementById("tableaccount"
						+ recordNo).value;
				editaccount.innerHTML = "<input type='text' id='account' name='account' value='"+tableaccount+"'>";
	
				var editaccountholder = document.getElementById("editaccountholder"
						+ recordNo);
				var tableaccountholder = document
						.getElementById("tableaccountholder" + recordNo).value;
				editaccountholder.innerHTML = "<input type='text' id='accountholder' name='accountholder' value='"+tableaccountholder+"'>";
	
				btn.value = "완료";
			} else if (btn.value == "완료") {
				btn.value = "수정";
				document.AccountForm.ano.value = recordNo;
				document.AccountForm.action = 'accountmodify';
				document.AccountForm.submit();
			}
		}
	
		function add_row() {
			var my_tbody = document.getElementById('my-tbody');
			var row = my_tbody.insertRow();
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			cell1.innerHTML = "<input type='text' id='bankname' name='bankname'>";
			cell2.innerHTML = "<input type='text' id='account' name='account'>";
			cell3.innerHTML = "<input type='text' id='accountholder' name='accountholder'>";
			cell4.innerHTML = "<center><input type='button' class='w-btn w-btn-blue' value='완료' onclick='fnCmdNew()'><center>";
		}
	
		function fnCmdNew() {
			document.AccountForm.ano.value = 0;
			document.AccountForm.action = 'addSave';
			document.AccountForm.submit();
		}
	
		function fnCmdDelete(recordNo) {
			document.AccountForm.ano.value = recordNo;
			document.AccountForm.action = 'deleteAccount';
			document.AccountForm.submit();
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
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
          <!-- ============================================================== -->
          <!-- 결제 설정-->
          <!-- ============================================================== -->
          	<div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>결제 설정</span>
		</div>

		<div class="goods_table_wrap">
			<h3>무통장입금 설정</h3>
			<form:form id="AccountForm" name="AccountForm" method="post">
				<input type="hidden" name="ano" />
				<table class="goods_table">
					<tr>
						<th>결제방법</th>
						<td>무통장입금</td>
					</tr>
					<tr>
						<th>은행계좌번호</th>
						<th><table class="goods_table" id="my-tbody">
								<tr>
									<th>은행명</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>기능</th>
								</tr>
								<c:forEach var="account" items="${account}" varStatus="status">

									<td id="editbankname${account.ano}">${account.bankname}<input
										type="hidden" id="tablebankname${account.ano}"
										name="tablebankname${account.ano}" value="${account.bankname}"></td>
									<td id="editaccount${account.ano}">${account.account}<input
										type="hidden" id="tableaccount${account.ano}"
										name="tableaccount${account.ano}" value="${account.account}"></td>
									<td id="editaccountholder${account.ano}">${account.accountholder}
										<input type="hidden" id="tableaccountholder${account.ano}"
										name="tableaccountholder${account.ano}"
										value="${account.accountholder}">
									</td>
									<th><input type="button" class="w-btn w-btn-blue" id="btn"
										value="수정" onclick="modifyAccount('${account.ano}')">
										<input type="button" class="w-btn w-btn-blue" value="삭제"
										onclick="fnCmdDelete('${account.ano}')"></th>
									<tbody id="my-tbody"></tbody>
								</c:forEach>
							</table> <input type="button" class="w-btn w-btn-blue" value="추가"
							onclick="add_row()"></th>

					</tr>
				</table>

			</form:form>
		</div>

		<div class="goods_table_wrap">
			<h3>배송정보</h3>
			<form action="deliverymodify" method="post"
				enctype="multipart/form-data">
				<table border="1" class="goods_table1">
					<c:forEach var="delivery" items="${delivery}" varStatus="status">
						<tr>
							<th>택배사</th>
							<th><input type="text" id="company" name="company"
								value="${delivery.company}"> <input type="hidden"
								id="dno" name="dno" value="${delivery.dno}"></th>
						</tr>
						<tr>
							<th>배송추적설정</th>
							<th><input type="text" id="link" name="link"
								value="${delivery.link}"></th>
						</tr>
						<tr>
							<th>배송비</th>
							<th><input type="text" id="cost" name="cost"
								value="${delivery.cost}"></th>
						</tr>
					</c:forEach>
				</table>
				<input type="submit" class="w-btn w-btn-blue" value="저장">
			</form>
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
