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
          <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var regdate = new Array(7);
  		  var ordercnt = new Array(7);
  		  var visitcnt = new Array(7);
  		  var joincnt = new Array(7);
  		  for(var i=0; i<=6; i++){
        	  regdate[i] = document.getElementById("regdate"+i).value;
        	  ordercnt[i] = parseInt(document.getElementById("ordercnt"+i).value);
        	  visitcnt[i] = parseInt(document.getElementById("visitcnt"+i).value);
        	  joincnt[i] = parseInt(document.getElementById("joincnt"+i).value);
    	  }
        var data = google.visualization.arrayToDataTable([
          ['날짜', '주문수', '방문자수', '가입자수'],
          
          [regdate[0], ordercnt[0], visitcnt[0], joincnt[0]],
          [regdate[1], ordercnt[1], visitcnt[1], joincnt[1]],
          [regdate[2], ordercnt[2], visitcnt[2], joincnt[2]],
          [regdate[3], ordercnt[3], visitcnt[3], joincnt[3]],
          [regdate[4], ordercnt[4], visitcnt[4], joincnt[4]],
          [regdate[5], ordercnt[5], visitcnt[5], joincnt[5]],
          [regdate[6], ordercnt[6], visitcnt[6], joincnt[6]]

        ]);

        var options = {
          chart: {
            title: '일자별 요약(주문수,방문자수,가입자수)'
          }
        };

        var chart = new google.charts.Bar(document.getElementById('line_chart'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>

  <body>
   <c:forEach var="manager" items="${main}" varStatus="status">
						
			<input type="hidden" id="regdate${status.index}" value="${manager.regDate}">
			<input type="hidden" id="ordercnt${status.index}" value="${manager.ordercnt}">
			<input type="hidden" id="visitcnt${status.index}" value="${manager.visitcnt}">
			<input type="hidden" id="joincnt${status.index}" value="${manager.joincnt}">

 </c:forEach>
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
      <div class="manager_content_wrap">
				<div class="card">
			    <h5 class="card-header">
			      <i class="far fa-chart-bar"> 사이트 현황<a href="/Manager/main">(돌아가기)</i>
			    </h5>
			    <div class="card-body">
		    		<div id="line_chart" style="width: 90%; height: 700px;"></div>
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
