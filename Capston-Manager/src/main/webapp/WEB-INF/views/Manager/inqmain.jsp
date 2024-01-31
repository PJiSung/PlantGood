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
    <title>1:1 문의</title>
    <link rel="stylesheet" href="../resources/css/manager/productadd.css?">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script type="text/javascript">
	function selectedOptionCheck() {
		$("#type > option[value=${param.type}]").attr("selected", "true");
	}
	function cleartext(){
		document.getElementById("keyword").value="";
	}
	</script>
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
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

	<body onload="selectedOptionCheck()">
	<input type="hidden" name="ino" />
	<input type="hidden" name="kno" />
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
          <!-- 상품 문의 -->
          <!-- ============================================================== -->
     	<div class="manager_content_wrap">
		<div class="manager_content_subject"><span>상품 문의</span></div>
		<div class="goods_table_wrap">
	
		<form action="inqmain" modelAttribute="searchVO" method="get">
				<select id="type" name="type">
					<option value="title">제목</option>
					<option value="memberid">작성자</option>
					<option value="kitname">상품명</option>
				</select> <input type="search" id="keyword" name="keyword"
					value="<%if (request.getParameter("keyword") != null) {
			out.print(request.getParameter("keyword"));
		} else {
			out.print("");
		}%>" />
				 <input
					type="submit" value="검색" class='w-btn w-btn-blue' />
	
	<div class="goods_table_wrap">
                    	
	                    
	                    	<table class="goods_table"> 
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">NO</td>
	                    				<td class="th_column_2">상태</td>
	                    				<td class="th_column_2">문의유형</td>
	                    				<td style="width:30%" class="th_column_4">제목</td>
	                    				<td class="th_column_5">작성자</td>
	                    				<td style="width:10%" class="th_column_6">작성일</td>
	                    				<td class="th_column_7">답변수</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach var="inquiry" items="${inqList}" varStatus="status">
	                    		
	                    		<tr onclick="location.href='inqinfo?ino=${inquiry.ino}'" style="cursor:pointer">
	                    		    <td><c:out value="${status.index+1}"></c:out></td> 
	                    		        <td><c:choose>
										    <c:when test="${inquiry.replycnt >= 1}">
										        답변 완료
										    </c:when>
										    <c:when test="${inquiry.replycnt == 0}">
										        답변 대기
										    </c:when>
										    <c:otherwise>
										    </c:otherwise>
										</c:choose></td>		        
	                    		    <td><c:out value="${inquiry.qnatype}"></c:out></td>
	                    		    <td><c:out value="${inquiry.title}"></c:out></td>
	                    			<td><c:out value="${inquiry.memberid}"></c:out></td>
	                    			<td><c:out value="${inquiry.regdate}"></c:out></td>
	                    			<td><c:out value="${inquiry.replycnt}"></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    ${pageHttp}
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
