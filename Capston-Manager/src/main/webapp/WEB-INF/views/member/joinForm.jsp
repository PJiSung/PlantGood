<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>

<style type="text/css">
	#result_card img{
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
	.imgDeleteBtn{
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/login/loginstyle.css" rel="stylesheet" type="text/css">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />


<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>

<script type="text/javascript">
	function moveAction(where) {
		switch (where) {
		case 1:
			location.href = "/shop/main";
			break;
		}
	}
</script>

<script type="text/javascript">

$(document).ready(function(){
	$( "#birth" ).datepicker({
    	dateFormat: 'yy-mm-dd',
    	changeMonth: true,
        changeYear: true,
        yearRange: "1950:2015"
    });

});

function idCheck(){
	
	if (joinForm.memberid.value.length < 1){
			alert("아이디를 입력하세요.");
			joinForm.memberid.focus();
			return false;
	}
	
	var id = $("#memberid").val();
	var access = $("#message");
	$.ajax({
		url:"/member/idCheck?memberid=" + id,
		type: 'get',
		dataType: 'json',
		success:function(result){
			if (result.msg=="true"){
				access.html("<font color='green' size='2px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>");
				$("#flag").val("true");
       	 	}
			else{
				access.html("<font color='red' size='2px;'><i class='fa fa-times'>&nbsp;이미 사용중인 아이디입니다.</i></font>");
				$("#flag").val("false");
			}
		}
	});
}


function DaumPostcode() {
new daum.Postcode({
	oncomplete: function(data) {
		var addr = '';
		var extraAddr = '';
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
			} else {
			addr = data.jibunAddress;
			}
		if(data.userSelectedType === 'R'){
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraAddr += data.bname;
				}
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
			if(extraAddr !== ''){
				extraAddr = ' (' + extraAddr + ')';
				}
			document.getElementById("addr2").value = extraAddr;
			} else {
				document.getElementById("addr2").value = '';
				}
		document.getElementById("zip").value = data.zonecode;
		document.getElementById("addr1").value = addr;
		document.getElementById("addr2").focus();
		}
}).open();
}


function Check_Form() 
{
	if (joinForm.passwd.value != joinForm.passwd_re.value){
		alert("패스워드가 일치하지 않습니다.");
		joinForm.passwd.focus();
		return false;
	}
	if($("#flag").val() == "false"){
		alert("ID 중복검사가 실시되지 않았습니다.");
		$("id").focus();
		return;
	}
	return true;
}


</script>

<script>
function checkErrCode(){
var msgCode = "${msgCode}";
if(msgCode != ""){
	alert(msgCode);
}
}
</script>



</head>

<body onload="checkErrCode()">


<!-- 사이트 박스 시작 -->
<section class="site-box min-height-100vh flex flex-column">



  <!-- 메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-md-up">
    <section class="main-box-section con">
      <!-- 로그인 페이지 시작 -->
      <div class="section-login min-height-50vh flex flex-jc-c flex-ai-c">
        <form id="login" class="input-group" name="joinForm" method=post  Action='join' onsubmit='return Check_Form()' >
          
          <div class="login-title">
           Sign Up
          </div>
          
          <div class="login_cell__body">
	          <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
	  		  <div id="uploadResult">
		  		<div id="result_card">
					<div class="imgDeleteBtn">x</div>
			  	</div>
	  		  </div>
  		  </div>

		  <div class="login_cell__body">
            <input  maxlength=20 size=20 id='memberid' name="memberid" class="input-field" placeholder="ID" required  onblur="idCheck();"  > 
            <span class="static" id="message"></span>
            <input type="hidden" id="flag" name="flag" value="false">
          </div>
          
          <div class="login_cell__body">
            <input type="text" name="nickname" placeholder="Nickname" class="input-field" required > 
          </div>

          <div class="login_cell__body">
            <input class="input-field" type=password name="passwd" size=20 maxlength="20" required  placeholder="password-1"> 
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" type=password name="passwd_re" size=20 maxlength=20 required placeholder="password-2">
          </div>
          
          <div class="login_cell__body">
     		<input name="name" placeholder="Name" class="input-field" class="input-field" required >
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" placeholder="Email" type=text id='reg_mb_email' name='email' size=38 maxlength=100  required  value=''>
            <span id='msg_mb_email'></span>
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" placeholder="Birthday" type='text' id='birth' name='birthday' size='10' maxlength='10' minlength='10' required numeric value=''>
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" type=text name='phone' size=21 maxlength=20 required placeholder='Phone' value=''>
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" placeholder="우편번호" type=text id="zip" name="zip" required >  
		    <a href="javascript:;" Onclick='DaumPostcode()'><img src="${pageContext.request.contextPath}/resources/img/btn_postsearch.gif" border=0 align=absmiddle></a>
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" placeholder="주소" type=text id="addr1" name="addr1" size=60  required >
          </div>
          
          <div class="login_cell__body">
     		<input class="input-field" placeholder="상세주소" type=text id='addr2' name='addr2' size=60 required >
          </div>
          
          <div class="loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Sign Up</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            
            </div>
        </form>
      </div>
      <!-- 로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 메인 컨텐츠 박스 끝 -->
  
  
  <!-- 모바일-메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">
      <!-- 모바일-로그인 페이지 시작 -->
      <div class="mobile-section-login min-height-50vh flex flex-jc-c flex-ai-c">

        <form id="login" class="input-group" name="joinForm" method=post  Action='join' onsubmit='return Check_Form()' >
          
          <div class="mobile-login-title">
           Sign Up
          </div>
          
          <div class="mobile-login_cell__body">
	          <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
	  		  <div id="uploadResult">
		  		<div id="result_card">
					<div class="imgDeleteBtn">x</div>
			  	</div>
	  		  </div>
  		  </div>

		  <div class="mobile-login_cell__body">
            <input  maxlength=20 size=20 id='memberid' name="memberid" class="input-field" placeholder="ID" required  onblur="idCheck();"  > 
            <span class="static" id="message"></span>
            <input type="hidden" id="flag" name="flag" value="false">
          </div>
          
          <div class="mobile-login_cell__body">
            <input type="text" name="nickname" placeholder="Nickname" class="input-field" required > 
          </div>

          <div class="mobile-login_cell__body">
            <input class="input-field" type=password name="passwd" size=20 maxlength="20" required  placeholder="password-1"> 
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" type=password name="passwd_re" size=20 maxlength=20 required placeholder="password-2">
          </div>
          
          <div class="mobile-login_cell__body">
     		<input name="name" placeholder="Name" class="input-field" class="input-field" required >
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" placeholder="Email" type=text id='reg_mb_email' name='email' size=38 maxlength=100  required  value=''>
            <span id='msg_mb_email'></span>
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" placeholder="Birthday" type='text' id='birth' name='birthday' size='10' maxlength='10' minlength='10' required numeric value=''>
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" type=text name='phone' size=21 maxlength=20 required placeholder='Phone' value=''>
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" placeholder="우편번호" type=text id="zip" name="zip" required >  
		    <a href="javascript:;" Onclick='DaumPostcode()'><img src="${pageContext.request.contextPath}/resources/img/btn_postsearch.gif" border=0 align=absmiddle></a>
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" placeholder="주소" type=text id="addr1" name="addr1" size=60  required >
          </div>
          
          <div class="mobile-login_cell__body">
     		<input class="input-field" placeholder="상세주소" type=text id='addr2' name='addr2' size=60 required >
          </div>
          
          <div class="mobile-loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Sign Up</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            </div>
        </form>
      </div>
      <!-- 모바일-로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 모바일-메인 컨텐츠 박스 끝 -->

</section>
<!-- 사이트 박스 끝 -->





<script>

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($(".imgDeleteBtn").length > 0){
		deleteFile();
	}
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	
	
	
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/member/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result){
    		console.log(result);
    		showUploadImage(result);
    	},
		error : function(result){
    		alert("이미지 파일이 아닙니다.");
    	}
	});	
	
	
});

/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;		
	
}

/* 이미지 출력 */
function showUploadImage(uploadResultArr){
	
	/* 전달받은 데이터 검증 */
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
	//let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	
	
	str += "<div id='result_card'>";
	str += "<img src='/member/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
	str += "</div>";		
	
		uploadResult.append(str);     
    
}


/* 이미지 삭제 버튼 동작 */
$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});


/* 파일 삭제 메서드 */
function deleteFile(){
	
	let targetFile = $(".imgDeleteBtn").data("file");
	
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: '/member/deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			
			targetDiv.remove();
			$("input[type='file']").val("");
			
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
}

</script>


</body>
</html>
