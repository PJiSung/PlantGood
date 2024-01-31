<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>상품 등록</title>
    <link rel="stylesheet" href="../resources/css/manager/productadd.css?">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/manager/productadd.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>

<script type="text/javascript">

function moveAction(where) {
	switch (where) {
	case 1:
		location.href = "kitmain";
		break;
	}
	
}
</script>

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

</head>
<body>
	<%@include file="../includes/ManagerHeader.jsp"%>

<div class="page-wrapper">
	<div class="manager_content_wrap">
		<div class="manager_content_subject">
			<span>식물 등록</span>
		</div>
		<div class="manager_content_main">

			<form:form modelAttribute="Plant" name="PlantForm" method="post" action="addplant" enctype="multipart/form-data" > 

				<div class="ct_left_area">
					<div class="form_section">
						<div class="form_section_title">
							<label>식물 이미지</label>
						</div>
						<div class="form_section_content">
							    <input style="height:100px" name="file_1" id="egovComFileUploader" type="file" title="첨부파일" />
							<div id="uploadResult">
								<div id="result_card">
									<div class="imgDeleteBtn">x</div>

								</div>
							</div>
						</div>

						<br> <br> <br>
					</div>
				</div>

				<div class="ct_right_area">
					<div class="form_section">
						<div class="form_section_title2">
							<label>식물명</label>
						</div>
						<div class="form_section_content2">
							<input type="text" id="kind" name="kind" />
						</div>
						<br>
						<div class="form_section_title2">
							<label>식물 종</label>
						</div>
						<div class="form_section_content2">
							<input type="text" id="category" name="category" />
						</div>
					</div>
				</div>
				
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>
				<br>
				<div class="form_section">
					<div class="form_section_title">
						<label>식물 내용</label>
					</div>
					<div class="form_section_content">
						<textarea id="contents" name="contents"></textarea>
					</div>
				</div>
				<div class="btn_section">
					<button id="cancelBtn" onclick="moveAction(1)"
						class="w-btn w-btn-blue">취 소</button>
					<input type="submit" class="w-btn w-btn-blue" value="등 록" />
				</div>
			</form:form>
		</div>
	</div>
	</div>
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