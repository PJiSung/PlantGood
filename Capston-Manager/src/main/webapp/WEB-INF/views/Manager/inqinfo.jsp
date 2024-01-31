<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<configuration>     <settings>         <setting
	name="jdbcTypeForNull" value="NULL" />     </settings> </configuration>
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
    <title>상품 문의</title>
	<link rel="stylesheet" href="../resources/css/manager/inqDetail.css?string">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		function moveAction(where) {
			switch (where) {
			case 1:
				location.href = "inqmain";
				break;
	
			case 2:
				if (confirm("해당 문의글을 삭제하시겠습니까?")) {
					location.href = "inqdelete?ino=${inq.ino}";
				}
				break;
			}
		}
	</script>
	
	<style type="text/css">
	#result_card img {
		max-width: 100%;
		height: auto;
		display: block;
		padding: 5px;
		margin-top: 10px;
		margin: auto;
	}
	</style>
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
          <!-- 상품 문의 -->
          <!-- ============================================================== -->
	<div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>상품 문의</span>
		</div>

		<!--<form name="inqstatemodify" id="inqstatemodify" method="post" enctype="multipart/form-data">-->
		<div class="goods_table_wrap">
			<input type="button" value="목록" onclick="moveAction(1)"
				class="w-btn w-btn-blue" /> <input type="button" value="삭제"
				onclick="moveAction(2)" class="w-btn w-btn-blue" />

			<table class="goods_table">
				<tr>
					<div id="uploadResult"></div>
				</tr>
			</table>


			<!-- <div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품명</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input type="text" id="kitname" name="kitname" value="${inq.kitname}" disabled/>
                    			</div>
                    </div>-->

			<input type="hidden" id="kno" name="kno" value="${kit.kno}" /> <input
				type="hidden" id="ino" name="ino" value="${inq.ino}" />
			<table class="goods_table">
				<tr>
					<th>문의유형</th>
					<td>${inq.qnatype}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${inq.memberid}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${inq.regdate}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${inq.title}</td>
					<th>첨부파일</th>
					<td colspan="4" align="left"><c:forEach var="file"
							items="${fileList}">
							<a href="filedown?fileName=${file.ofilename}" class="fileview">
								<font size="2px">${file.ofilename}</font> <font size="2px">(${file.filesize}
									byte)</font><br>
							</a>
						</c:forEach> <c:if test="${empty fileList}">
							<font color="#A6A6A6" size="2px"> 첨부된 파일이 없습니다. </font>
						</c:if></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="10">${inq.contents}</td>
				</tr>
			</table>
		</div>
		<div class="goods_table_wrap">
			<table class="goods_table">
				<tr>
					<th colspan="2">댓글</th>
				</tr>
				<c:forEach var="reply" items="${replyList}">
					<tr>
						<td>
							<p>${reply.managerid}</p>
						</td>
						<td align="left"><span class="date">${reply.regdate}</span>
							<p>${reply.contents}</p></td>
					</tr>
				</c:forEach>

				<tr>
					<td><strong>댓글 쓰기</strong></td>
					<td>
						<form modelAttribute="replyVO" action="writeReply" method="post">
							<input type="hidden" id="managerid" name="managerid"
								value="${managerid}" /> <input type="hidden" id="ino"
								name="ino" value="${inq.ino}" />
							<div class="form_section_content">
								<textarea id="contents" name="contents"></textarea>
							</div>
							<input type="submit" value="확인" class="w-btn w-btn-blue" />
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<br />
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
