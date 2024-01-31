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
    <title>식물 관리</title>
    <link rel="stylesheet" href="../resources/css/manager/productadd.css?">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	function selectedOptionCheck() {
		$("#type > option[value=${param.type}]").attr("selected", "true");
	}
	
	function checkSelectAll()  {
		  const checkboxes 
		    = document.querySelectorAll('input[name="delsete"]');
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
		document.PlantForm.action = 'deleteplant';
		document.PlantForm.submit();
	}
	
	function cleartext(){
		document.getElementById("keyword").value="";
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

	<body onload="selectedOptionCheck()">
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
          <!-- 오늘의 할일 -->
          <!-- ============================================================== -->
		          <div class="manager_content_wrap" >
				<div class="manager_content_subject">
				<span>식물 관리</span></div>
				<div class="goods_table_wrap">
		
				<form action="plant" modelAttribute="searchVO" method="get">
				<input type="search" id="keyword" name="keyword"
					value="<%if (request.getParameter("keyword") != null) {
								out.print(request.getParameter("keyword"));
							} else {
								out.print("");
							}%>" />
				
				<input type="submit" value="검색" class='w-btn w-btn-blue' />
			</form>
		
			<br>
			
			<form:form id="PlantForm" name="PlantForm" method="post">
				<input type="hidden" name="pno" />
				<table class="goods_table">
				<thead>
					<tr>
						<c:forEach var="plant" items="${totalcnt}" varStatus="status">
							<th colspan='8'>전체 식물(${plant.total})</th>
						</c:forEach>
					</tr>
					<tr>
						<td style="width:5%"><input type="checkbox" name="selectall" value="selectall"
							onclick="selectAll(this)"></td>
						<td style="width:5%" class="th_column_4">NO</td>
						<td class="th_column_4">이름</td>
			            <td class="th_column_3">종류</td>
			            <td style="width:30%" class="th_column_3">내용</td>
					</tr>
				</thead>
					<c:forEach var="plant" items="${plant}" varStatus="status">
						<tr>
							<td><input type="checkbox" name="delete"
								value="${plant.pno}" onclick="checkSelectAll()"></td>
								
								<td><c:out value="${status.index+1}"></c:out></td>
								<td><c:out value="${plant.kind}"></c:out></td>
								<td><c:out value="${plant.category}"></c:out></td>
								<td><c:out value="${plant.contents}"></c:out></td>				
						</tr>
					</c:forEach>
				</table>
				<input type="button" value="선택 삭제" onclick="fnCmdDelete()" class='w-btn w-btn-blue'>
			</form:form>
			<br>${pageHttp}
			<br>
			<br>
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
