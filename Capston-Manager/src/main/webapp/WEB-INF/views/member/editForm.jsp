<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원수정</title>

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

	return true;
}

</script>


<style>
.imgDeleteBtn{
	    float: right;
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
</head>

<body>



<!-- 사이트 박스 시작 -->
<section class="site-box min-height-100vh flex flex-column">


  <!-- 모바일 탑바 시작 -->
  <section class="mobile-top-bar-padding flex flex-ai-c visible-sm-down">
    <div class="mobile-top-bar_btn-toggle-side-bar flex-as-c visible-sm-down">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </section>
  <header class="mobile-top-bar flex visible-sm-down">
    <div class="flex-1-0-0 flex flex-jc-c flex-ai-c">
      <div class="mobile-title">
        <a href="../home/main">
          Get <span>IT</span>
        </a>
      </div>
    </div>
  </header>
  <!-- 모바일 탑바 끝 -->
  <!-- 모바일 사이드메뉴바 시작-->
  <aside class="mobile-side-bar flex flex-column flex-jc-c visible-sm-down">
    <span>MENU</span>
    <nav class="mobile-side-bar_menu flex flex-jc-c">
      <ul class="">
        <li title="NOTICE">
          <a href="../article/list?boardId=1" class="block">
            <span>NOTICE</span>
          </a>
        </li>
        <li>
          <a class="block">
            <span>BOARD</span>
          </a>
          <ul class="hide">
            <li title="NEWS">
              <a href="../article/list?boardId=2" class="block">
                <span>NEWS</span>
              </a>
            </li>
            <li title="FREE">
              <a href="../article/list?boardId=3" class="block">
                <span>FREE</span>
              </a>
            </li>
          </ul>
        </li>
        <li title="SEARCH">
          <a href="search.html" class="block">
            <span>SEARCH</span>
          </a>
        </li>
        <li>
          <a class="block">
            <span>LINK</span>
          </a>
          <ul class="hide">
            <li title="T-STORY">
              <a href="https://cjy324.tistory.com/" target="_blank" class="block">
                <span>T-STORY</span>
              </a>
            </li>
            <li title="GITHUB">
              <a href="https://github.com/cjy324/TIL_Jooyoung#til_jooyoung" target="_blank" class="block">
                <span>GITHUB</span>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <div class="mobile-side-bar_menu flex flex-jc-c">
     <c:if test="${isLogined}">
      <div class="mobile-side-bar-button"><a href="../home/main"><i class="fas fa-home"></i> 홈</a></div>
      <div class="mobile-side-bar-button"><a href="../member/showMyPage"><i class="fas fa-user-cog"></i> 회원정보</a></div>
      <div class="mobile-side-bar-button"><a href="../member/doLogout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></div>
      </c:if>
    </div>
  </aside>
  <!-- 모바일 사이드메뉴바 끝 -->

  <!-- 메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-md-up">
    <section class="main-box-section con">
      <!-- 로그인 페이지 시작 -->
      <div class="section-login min-height-50vh flex flex-jc-c flex-ai-c">
        <form id="fregisterform" name="joinForm" method=post  Action='editUser' onsubmit='return Check_Form()' >
        <input type="hidden" id="cno" name="cno" value="${userVO.cno}" /> 
          
          <div class="login-title">
           User Modify
          </div>
          
          <div class="login_cell__body">
	            <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
  				
  				<div id="uploadResult">
																		
				</div>
  		  </div>

		  <div class="login_cell__body">
            <input  maxlength=20 size=20 id='memberid' name="memberid" class="ed" required readonly value="${userVO.memberid}" />
            <span id="message"></span>
            <input type="hidden" id="flag" name="flag" value="false">
          </div>
          
          <div class="login_cell__body">
            <input name="nickname" placeholder="nickname" class="ed2" class="ed" required value="${userVO.nickname}" readonly >
          </div>

          <div class="login_cell__body">
            <input class=ed type=password name="passwd" size=20 maxlength="20" required  placeholder="password-1" value="">
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=password name="passwd_re" size=20 maxlength=20 required placeholder="password-2" value="">
          </div>
          
          <div class="login_cell__body">
     		<input name="name" placeholder="name" class="ed2" class="ed" required value="${userVO.name}" readonly >
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=text id='reg_mb_email' name='email' size=38 maxlength=100  required  value="${userVO.email}">
            <span id='msg_mb_email'></span>
          </div>
          
          <div class="login_cell__body">
     		<input class='ed' type='text' id='birth' name='birthday' size='10' maxlength='10' minlength='10' required value="${userVO.birthday}">
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=text name='phone' size=21 maxlength=20 required placeholder='전화번호' value="${userVO.phone}">
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=text id="zip" name="zip" required value="${userVO.zip}"> 
		    <a href="javascript:;" Onclick='DaumPostcode()'><img src="${pageContext.request.contextPath}/resources/img/btn_postsearch.gif" border=0 align=absmiddle></a>
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=text id="addr1" name="addr1" size=60  required value="${userVO.addr1}">
          </div>
          
          <div class="login_cell__body">
     		<input class=ed type=text id='addr2' name='addr2' size=60 required value="${userVO.addr2}">
          </div>
          
          <div class="loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Modify</button>
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

        <form name="form" onsubmit="check(this); return false;" action="doLogin" method="POST">
          <input type="hidden" name="loginPwReal">
          <div class="mobile-login-title">
           LOGIN
          </div>
          <div class="mobile-login_cell__title">
            <span>아이디</span>
          </div>
          <div class="mobile-login_cell__body">
            <input type="text" name="loginId" maxlength="50" placeholder="ID">
          </div>
          <div class="mobile-login_cell__title">
            <span>비밀번호</span>
          </div>
          <div class="mobile-login_cell__body">
            <input type="password" name="loginPw" maxlength="50" placeholder="Password">
          </div>
          <div class="mobile-loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
            <button class="btn btn-back" type="button" onclick="history.back();"><i class="fas fa-undo"></i> Back</button>
            </div>
            <div>
            <a href="../member/doFindLoginIdForm">ID 찾기</a>
           / <a href="../member/doFindLoginPwForm">PW 찾기</a>
              </div>
            </div>
        </form>
      </div>
      <!-- 모바일-로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 모바일-메인 컨텐츠 박스 끝 -->
  
  
  <!-- 맨 위 버튼 시작 -->
  <nav class="top-button btn flex flex-jc-c flex-ai-c">
    <div class="">
      <a href="#header"><i class="fas fa-chevron-up"></i></a> 
    </div>     
  </nav>
  <!-- 맨 위 버튼 끝 -->
  
  
  <!-- 맨 아래 버튼 시작 -->
  <nav class="bottom-button btn flex flex-jc-c flex-ai-c">
    <div class="">
      <a href="#bottom"><i class="fas fa-chevron-down"></i></a> 
    </div>     
  </nav>
  <!-- 맨 아래 버튼 끝 -->
  
  
  
</section>
<!-- 사이트 박스 끝 -->





<script>


$(document).ready(function(){
	
	/* 이미지 정보 호출 */
	let cno = '<c:out value="${user.cno}"/>';
	let uploadResult = $("#uploadResult");	
	
	
	$.getJSON("/member/getAttachList2", {cno : cno}, function(arr){	
		
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
		let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
		//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/member/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";	
		
		
		uploadResult.html(str);						
		
	});	
	
	
}); 


/* 이미지 삭제 버튼 동작 */
$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});

/* 파일 삭제 메서드 */
function deleteFile(){
	
	$("#result_card").remove();
	
}


/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($("#result_card").length > 0){
		deleteFile();
	}
			
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
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
	//replace 적용 하지 않아도 가능
	//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	
	str += "<div id='result_card'>";
	str += "<img src='/member/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
	str += "</div>";		
	
		uploadResult.append(str);     
    
}

</script>

</body>
</html>
