                                            <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/temphumi.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/smartpot/reg.css" rel="stylesheet" type="text/css">
<title>나의 식물 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function replaceDate(date){
		document.getElementById("regdate").value = date.re placeAll("-","/");
	}                              
</script>

<style>
table, th, td {
  }
#btn {
	border: 1px solid blue;
	background-color: rgba(0, 0, 0, 0);
	color: blue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: -4px;
	height: 40px;
}

table {
	border-collapse: collapse;
	width: 384px;
}

table, td, th {
}

tr {
}

td, th {
	padding: 4px;
}

.set1 {
	background-color: red;
	color: white;
	text-decoration: underline;
	font-weight: bold;
}

#c_head {
	height: 30px;
	background-color: #eeeeee;
}

#c_width {
	width: 500px;
}
</style>


</head>
<body>
  <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">
	<form name="regForm" action="addreg" method="post"
		enctype="multipart/form-data">
		<input type="hidden" id="memberid" name="memberid" value="${memberid}">
		<input type="hidden" id="kind" name="kind" value="${plant.kind}">
		<input type="hidden" id="category" name="category" value="${plant.category}">
		<input type="hidden" id="regdate" name="regdate">
			<center><h1>나의 식물 등록</h1></center>
			<table>
			<tr>
				<td>
				<div class="imgdiv"><img src="<c:url value='/resources/img/식물품종.jpg'/>" height="80px" width="40px" alt=""></div>
				<div class="spandiv"><span class="left1">식물품종</span><br><input class="inputkind" type="text" value="${plant.kind}" disabled></div></td>
			</tr>
			<tr>
				<td class="">
				<div class="imgdiv"><img src="<c:url value='/resources/img/식물품종.jpg'/>" height="80px" width="40px" alt=""></div>
				<div class="spandiv"><span class="left2">이름</span><br><input class="inputname" type="text" id="name" name="name"></div></td>
			</tr>
			<tr>
				<td>
				<div class="imgdiv2"><img src="<c:url value='/resources/img/달력.png'/>" height="50px" width="40px" alt=""></div>
				<div class="spandiv"><span class="left3">식물 입양날짜</span><br><input class="inputdate" type="date" id="start" name="regdate" value="" min="2022-01-01" max="2022-12-31" onchange="replaceDate(this.value)"></div></td>
			</tr>
			<tr>
				<th>
				<div class="imgdiv2"><img src="<c:url value='/resources/img/사진등록.jpg'/>" height="40px" width="40px" alt=""></div>
				<div class="spandiv">사진등록<br>
				<div class="filemargin">
					<input type="file" id ="fileItem" name='uploadFile'>
					<div id="uploadResult">
								<div id="result_card">
									<div class="imgDeleteBtn">x</div>
								</div>
					</div>
				</div>
				</div>
				</th>
			</tr>
		</table>
			<center><input type="submit" class="btn btn-go" value="등록"></center>
	</form>
	
	</section>
	</main>
	<script>
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {

			/* 이미지 존재시 삭제 */
			if ($(".imgDeleteBtn").length > 0) {
				deleteFile();
			}

			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			formData.append("uploadFile", fileObj);

			$.ajax({
				url : '/smartpot/uploadAjaxAction',
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

			str += "<div id='result_card'>";
			str += "<img src='/smartpot/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";

			uploadResult.append(str);

		}

		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {

			deleteFile();

		});

		/* 파일 삭제 메서드 */
		function deleteFile() {

			let targetFile = $(".imgDeleteBtn").data("file");

			let targetDiv = $("#result_card");

			$.ajax({
				url : '/smartpot/deleteFile',
				data : {
					fileName : targetFile
				},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					console.log(result);

					targetDiv.remove();
					$("input[type='file']").val("");

				},
				error : function(result) {
					console.log(result);

					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
	</script>
	
	
</body>
</html>