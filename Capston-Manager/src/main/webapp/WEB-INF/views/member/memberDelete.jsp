<%@ page import="com.jang.biz.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
<title>회원 탈퇴</title>
		<!-- Additional CSS Files -->
	    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/font-awesome.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/fullpage.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/owl.carousel.css">
	    <link rel="stylesheet" href="../resources/css/animate.css">
	    <link rel="stylesheet" href="../resources/css/templatemo-style.css">
	    <link rel="stylesheet" href="../resources/css/responsive.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">




/* ajax를 통한 탈퇴처리 */
function deleteMember() {	
	
	var inputPass = prompt("비밀번호를 입력해주세요.");
	
	if(inputPass.trim() != '') {
		
		var memberid = $("#memberid").val();
		var cno = $("#cno").val();
		var param = {"memberid":memberid, "passwd":inputPass, "cno":cno}
		
		
			$.ajax({			
				async: true,
				type: 'POST',
				data: JSON.stringify(param),
				
				url: "/member/memberDelete",
				dataType: "text",
				contentType: "application/json; charset=UTF-8",
				success: function(data) {	
					if(data == "success") {					
						alert("탈퇴가 처리되었습니다.");
						location.href="/member/login";
					} else {
						alert("비밀번호가 맞지 않습니다.");
					}	
				},
					
			})		
	} else {
		alert("비밀번호를 제대로 입력해주세요.");
	}
}
</script>
</head>
<body>


<div id="video">
		<header id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <a href="/shop/main" id="logo" title="Elegance by TemplateMo">
                        Planty Good
                    </a>
                    <div class="navigation-row">
                        <nav id="navigation">
                            <button type="button" class="navbar-toggle"> <i class="fa fa-bars"></i> </button>
                            <div class="nav-box navbar-collapse">
                            
                            	<ul class="navigation-menu nav navbar-nav navbars" id="nav">
					                <c:if test = "${memberid == null}">	<!-- 로그인 x -->	
										<li>
											<a href="/member/login">Login</a>
										</li>
										<li>
										</li>
										<li>
											<a href="/member/join">Sign Up</a>
										</li>
									</c:if>
									<c:if test="${memberid != null }">	<!-- 로그인 o -->		
										<c:if test="${adminCk == 1}">	<!-- 관리자 계정 -->
											<li>
												<a href="/Manager/main">관리자 페이지</a>
											</li>
										</c:if>	
										<li></li>				
										<li>
												
												<a href="/shop/mypage">마이페이지  </a>
										</li>
										<li></li>
										<li>
											<a href="basket?memberid=${memberid}">장바구니</a>
										</li>	
										<li></li>
										<c:if test="${ memberid != null }">
											<li>
												<a href="/member/logout">로그아웃</a>
											</li>
										</c:if>
									</c:if>	
			                    </ul>

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        
        <video autoplay muted loop id="myVideo">
          <source src="../resources/images/video-bg.mp4" type="video/mp4">
        </video>
        
        
        <div id="fullpage" class="fullpage-default">
        
        	 <div class="section animated-row" data-section="slide07">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-7 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <h1>회원 탈퇴</h1>
                            </div>
                            <div class="contact-section">
                                
                                    
                                    
                                        <div class="animate" data-animate="fadeInUp">
                                            <div class="input-field">
                                                <input type="text" class="form-control" name="userName" id="userName" value="${userName}" >
                                            </div>
                                            
                                            <div class="input-field">
                                                <input type="text" class="form-control" name="memberid" id="memberid" value="${memberid}" >
                                            </div>
                                            
                                            <input type="hidden" id="memberid" name="memberid" value="${memberid}" />
											<input type="hidden" id="cno" name="cno" value="${cno}" />
											<button type="button" class="btn" style="width:200px;" onclick="deleteMember()" class="w-btn w-btn-blue">회원 탈퇴</button>
										</div>
										
										
                                    
                                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    	</div>
</div>




	
	<script src="../resources/js/bootstrap.min.js"></script>

    <script src="../resources/js/fullpage.min.js"></script>

    <script src="../resources/js/scrolloverflow.js"></script>

	<script src="../resources/js/owl.carousel.min.js"></script>

    <script src="../resources/js/jquery.inview.min.js"></script>

    <script src="../resources/js/custom.js"></script>
	
</body>
</html>