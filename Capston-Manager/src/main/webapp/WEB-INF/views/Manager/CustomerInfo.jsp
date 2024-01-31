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
    <title>고객 정보</title>
	<link rel="stylesheet" href="../resources/css/manager/customerInfo.css?">
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
		onload = function() {
			var category = document.getElementById("adminck").value;
			if (category == 0) {
				document.getElementById("general").checked = true;
			} else if (category == 1) {
				document.getElementById("manager").checked = true;
			}
		}
	
		function moveAction(where) {
			switch (where) {
			case 1:
				location.href = "customer";
				break;
			}
		}
	</script>
	
	<style type="text/css">
	#result_card img {
		max-width: 200%;
		height: auto;
		display: block;
		padding: 10px;
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
          <!-- 상품 상세 -->
          <!-- ============================================================== -->
		<div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>고객 정보</span>
		</div>

		<div class="goods_table_wrap">
			<input type="hidden" id="adminck" name="adminck"
				value="${customer.adminck}" />
			<form action="customermodify" method="post"
				enctype="multipart/form-data">
				<table class="goods_table2">
					<tr>
						<th>
							<div id="uploadResult">프로필</div>
						</th>
					</tr>
					<tr>
						<th><input type="text" id="name" name="name"
							value="${customer.name}"> <input type="hidden" id="cno"
							name="cno" value="${customer.cno}" /></th>
					</tr>
				</table>

				<div class="ct_left_area">
					<table class="goods_table">
						<tr>
							<th align="center">회원정보</th>
						</tr>
						<tr>
							<td>회원유형</td>

							<td><label> <input type="radio" id="general"
									class="goods_tableradio" name="adminck" value=0>일반회원 <input
									type="radio" id="manager" class="goods_tableradio"
									name="adminck" value=1>관리자
							</label></td>
						</tr>

						<tr>
							<td>닉네임</td>

							<td><input type="text" class="goods_tableinput"
								id="nickname" name="nickname" value="${customer.nickname}"></td>
						</tr>

						<tr>
							<td>이메일</td>

							<td><input type="text" class="goods_tableinput" id="email"
								name="email" value="${customer.email}"></td>
						</tr>

						<tr>
							<td>아이디</td>

							<td><input type="text" class="goods_tableinput"
								id="memberid" name="memberid" value="${customer.memberid}"></td>
						</tr>
					</table>
				</div>
				<div class="ct_right_area">
					<table class="goods_table3">

						<tr>
							<th align="center">활동정보</th>
						</tr>

						<tr>
							<td>가입일</td>
							<td>${customer.regdate}</td>
						</tr>

						<tr>
							<td>작성</td>
							<td>문의 ${postcnt.postcnt}개
							<br>주문 ${ordercnt.ordercnt}개
							</td>
						</tr>
						<tr>
							<td>관리자 메모</td>
							<td><input type="text" id="memo" name="memo"
								value="${customer.memo}"></td>
						</tr>

					</table>
				</div>
				<div class="btn_section">
					<input type="button" value="뒤로" onclick="moveAction(1)"
						class="w-btn w-btn-blue" /> <input type="submit" value="저장"
						class="w-btn w-btn-blue" />
				</div>
			</form>
		</div>
	</div>
		  		
  		<script>
		$(document)
				.ready(
						function() {

							/* 이미지 정보 호출 */
							let cno = '<c:out value="${customer.cno}"/>';
							let uploadResult = $("#uploadResult");

							$
									.getJSON(
											"/Manager/getAttachList2",
											{
												cno : cno
											},
											function(arr) {

												if (arr.length === 0) {

													let str = "";
													str += "<div id='result_card'>";
													str += "<img src='/resources/img/goodsNoImage.jpg'>";
													str += "</div>";

													uploadResult.html(str);

													return;
												}

												let str = "";
												let obj = arr[0];

												//let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
												//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
												//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
												let fileCallPath = obj.uploadPath
														.replace(/\\/g, '/')
														+ "/s_"
														+ obj.uuid
														+ "_" + obj.fileName;
												//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
												str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
												str += "<img src='/Manager/display2?fileName="
														+ fileCallPath + "'>";
												//str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
												//str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
												//str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
												//str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
												str += "</div>";

												uploadResult.html(str);

											});

						});
	</script>
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
