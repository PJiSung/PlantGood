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
    <title>상품 상세</title>
	<link rel="stylesheet" href="../resources/css/manager/productadd.css?">
	
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
	function moveAction(where){
		  switch (where) {
				case 1:
					location.href = "kitmain";
				break;
				
				case 2:
					if(confirm("글을 삭제하시겠습니까?")){
						location.href = "kitdelete?kno=${kit.kno}";
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
          <!-- 상품 상세 -->
          <!-- ============================================================== -->
		<form action="kitmodify" method="post" enctype="multipart/form-data">
		<div class="manager_content_wrap">
			<div class="manager_content_subject">
				<span>상품 상세</span>
			</div>
			<div class="manager_content_main">
				<div class="ct_left_area">
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 이미지</label>
						</div>
						<div class="form_section_content">
							<input type="file" id="fileItem" name='uploadFile'
								style="height: 30px;">
							<div id="uploadResult"></div>
						</div>

						<br> <br> <br>
					</div>
				</div>

				<div class="ct_right_area">
					<div class="form_section">
						<div class="form_section_title2">
							<label>상품명</label>
						</div>
						<div class="form_section_content2">
							<input type="text" id="kitname" name="kitname"
								value="${kit.kitname}" /> <input type="hidden" id="kno"
								name="kno" value="${kit.kno}" />
						</div>
						<br>
						<div class="form_section_title2">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content2">
							<input type="number" id="kitstock" name="kitstock"
								value="${kit.kitstock}" />
						</div>
						<br>
						<div class="form_section_title2">
							<label>상품 가격</label>
						</div>
						<div class="form_section_content2">
							<input type="number" id="kitprice" name="kitprice"
								value="${kit.kitprice}" />
						</div>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 내용</label>
					</div>
					<div class="form_section_content">
						<textarea name="kitcontents" id="kitcontents">${kit.kitcontents}</textarea>
					</div>
				</div>

				<div class="btn_section">
					<input type="button" value="뒤로" onclick="moveAction(1)"
						class="w-btn w-btn-blue" /> <input type="submit" value="저장"
						class="w-btn w-btn-blue" /> <input type="button" id="deleteBtn"
						value="삭 제" class="w-btn w-btn-red" onclick="moveAction(2)" />
				</div>
			</div>
		</div>
	
		<br />
	</form>
	  		
	<script>
	
		$(document).ready(function(){

			/* 이미지 정보 호출 */
			let kno = '<c:out value="${kit.kno}"/>';
			let uploadResult = $("#uploadResult");		
			
			$.getJSON("/Manager/getAttachList", {kno : kno}, function(arr){	
				
				if(arr.length === 0){	
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
				//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
				let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
				str += ">";
				str += "<img src='/Manager/display?fileName=" + fileCallPath +"'>";
				str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
				str += "</div>";	
				
				
				uploadResult.html(str);						
				
			});				
			
			
		}); 
	</script>

	<script>
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {

			deleteFile();

		});

		/* 파일 삭제 메서드 */
		function deleteFile() {

			$("#result_card").remove();

		}

		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {

			/* 이미지 존재시 삭제 */
			if ($("#result_card").length > 0) {
				deleteFile();
			}

			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}

			formData.append("uploadFile", fileObj);

			$.ajax({
				url : '/Manager/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});
		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}

		/* 이미지 출력 */
		function showUploadImage(uploadResultArr) {

			/* 전달받은 데이터 검증 */
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}

			let uploadResult = $("#uploadResult");

			let obj = uploadResultArr[0];

			let str = "";

			let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_"
					+ obj.uuid + "_" + obj.fileName;
			//let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
			//replace 적용 하지 않아도 가능
			//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/Manager/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";

			uploadResult.append(str);

		}
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
