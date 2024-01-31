<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./jsp_header.jsp" %>



<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<link href="${pageContext.request.contextPath}/resources/css/login/findstyle.css" rel="stylesheet" type="text/css">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function moveAction(where) {
		switch (where) {
		case 1:
			location.href = "/member/login";
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
        <form:form modelAttribute="userVO" Name='findIdForm' Method='post' Action='/member/findId' onsubmit='return Check_Pre()'>
          
          <div class="login-title">
           아이디 찾기
          </div>
          <div class="login_cell__title">
            
          </div>
          <div class="login_cell__body">
            ${memberid}님의 패스워드가 변경되었습니다.
          </div>
          <div class="login_cell__title">
            
          </div>
          <div class="login_cell__body">
     		
          </div>
          <div class="loginInput_cell">
            <div>
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

        <form:form modelAttribute="userVO" Name='findIdForm' Method='post' Action='/member/findId' onsubmit='return Check_Pre()'>
          
          <div class="mobile-login-title">
           아이디 찾기
          </div>
          
          <div class="mobile-login_cell__body">
            ${memberid}님의 패스워드가 변경되었습니다.
          </div>
          
          <div class="mobile-login_cell__body">
            
          </div>
          <div class="mobile-loginInput_cell">
             <div>
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



<br><br>
	<div align="center" class="body">
		<h3>${memberid}님의 패스워드가 변경되었습니다.</h3>
		<br>
		<br><br><br>

	<a href="/member/login">[로그인]</a>
	</div>	
	
</body>
</html>