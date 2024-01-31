<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./jsp_header.jsp" %>



<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="${pageContext.request.contextPath}/resources/css/login/findstyle.css" rel="stylesheet" type="text/css">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>


function Check_Pass()
{
	if (updatePassForm.passwd.value.length < 1){
		alert ("패스워드를 입력하세요.");
		updatePassForm.passwd.focus();
		return false;
	}
	if (updatePassForm.pass2.value.length < 1){
		alert ("패스워드 확인을 입력하세요.");
		updatePassForm.passwd.focus();
		return false;
	}
	if(updatePassForm.passwd.value != updatePassForm.pass2.value){
		alert("패스워드가 일치하지 않습니다.");
		updatePassForm.passwd.value="";
		updatePassForm.pass2.value="";
		updatePassForm.passwd.focus();
		return false;
	}
	return true;
}


</script>

<script type="text/javascript">
	function moveAction(where) {
		switch (where) {
		case 1:
			location.href = "/member/findPass";
			break;
		}
	}
</script>



</head>

<body>

<!-- 사이트 박스 시작 -->
<section class="site-box min-height-100vh flex flex-column">

  

  

  <!-- 메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-md-up">
    <section class="main-box-section con">
      <!-- 로그인 페이지 시작 -->
      
      <div class="section-login min-height-50vh flex flex-jc-c flex-ai-c">
      <br><span class="fieldError" align='center'>${errMsg}</span><br>
        <form:form modelAttribute="userVO" Name='updatePassForm' Method='post' Action='/member/updatePass' onsubmit='return Check_Pass()'>
          
          <div class="login-title">
           새 비밀번호 등록
          </div>
          
          <div class="login_cell__body">
            <form:input path="memberid" maxlength="20" size='10' value="${memberid}" cssClass="memberid" placeholder="ID" />
			<br>
			<span class="fieldError"><form:errors path="memberid" /></span>
          </div>
          
          <div class="login_cell__body">
     		<form:password path="passwd" maxlength="20" cssClass="password" size='10' placeholder="New Password-1" />
			<br>
			<span class="fieldError"><form:errors path="passwd" /></span>
          </div>
          
          <div class="login_cell__body">
     		<input type="password" name="pass2" maxlength="20" cssClass="password" size='10' value="" showPassword="true" placeholder="New Password-2"/>
          </div>
          
          <div class="loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Modify</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            
            </div>
        </form:form>
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

        <br><span class="fieldError" align='center'>${errMsg}</span><br>
        <form:form modelAttribute="userVO" Name='updatePassForm' Method='post' Action='/member/updatePass' onsubmit='return Check_Pass()'>
          
          <div class="mobile-login-title">
           새 비밀번호 등록
          </div>
          
          <div class="mobile-login_cell__body">
            <form:input path="memberid" maxlength="20" size='10' value="${memberid}" cssClass="memberid" placeholder="ID" />
			<br>
			<span class="fieldError"><form:errors path="memberid" /></span>
          </div>
          
          <div class="mobile-login_cell__body">
            <form:password path="passwd" maxlength="20" cssClass="password" size='10' placeholder="New Password-1" />
			<br>
			<span class="fieldError"><form:errors path="passwd" /></span>
          </div>
          
          <div class="mobile-login_cell__body">
     		<input type="password" name="pass2" maxlength="20" cssClass="password" size='10' value="" showPassword="true" placeholder="New Password-2"/>
          </div>
          
          <div class="mobile-loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Modify</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            
            </div>
        </form:form>
      </div>
      <!-- 모바일-로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 모바일-메인 컨텐츠 박스 끝 -->
  
  
</section>
<!-- 사이트 박스 끝 -->

</body>
</html>

