<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>

<link href="${pageContext.request.contextPath}/resources/css/login/loginstyle.css" rel="stylesheet" type="text/css">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<script type="text/javascript">
function checkErrCode(){
var msgCode = "${msgCode}";
if( msgCode != ""){
	alert(msgCode);
}
}


</script>

<script type="text/javascript">
	function moveAction(where) {
		switch (where) {
		case 1:
			location.href = "/shop/main";
			break;
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
        <form:form modelAttribute="userVO" id="login" class="input-group" name="login-form" method="post" action="login">
          
          <div class="login-title">
           LOGIN
          </div>

          <div class="login_cell__body">
            <input name='memberid' type="text" class="input-field" placeholder="ID" required/> 
          </div>
          
          <div class="login_cell__body">
     		<input name='passwd' type="password" class="input-field" placeholder="Password" required />
          </div>
          
          <div class="loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            <div>
            <a href="/member/findId">ID 찾기</a>
           / <a href="/member/findPass">PW 찾기</a>
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

        <form:form modelAttribute="userVO" id="login" class="input-group" name="login-form" method="post" action="login">
          <input type="hidden" name="loginPwReal">
          <div class="mobile-login-title">
           LOGIN
          </div>
          
          <div class="mobile-login_cell__body">
            <input name='memberid' type="text" class="input-field" placeholder="ID" required/> 
          </div>
          
          <div class="mobile-login_cell__body">
            <input name='passwd' type="password" class="input-field" placeholder="Password" required />
          </div>
          <div class="mobile-loginInput_cell">
            <div>
            <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
            <button class="btn btn-back" type="button" onclick="moveAction(1)"><i class="fas fa-undo"></i> Back</button>
            </div>
            <div>
            <a href="/member/findId">ID 찾기</a>
           / <a href="/member/findPass">PW 찾기</a>
              </div>
            </div>
        </form:form>
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






        
</body>
</html>

