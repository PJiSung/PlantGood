<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
<title>새 글 쓰기</title>
		<!-- Additional CSS Files -->
	    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/font-awesome.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/fullpage.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/owl.carousel.css">
	    <link rel="stylesheet" href="../resources/css/animate.css">
	    <link rel="stylesheet" href="../resources/css/templatemo-style.css">
	    <link rel="stylesheet" href="../resources/css/responsive.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function formCheck() {
		if (writeForm.title.value.length < 1){
				alert("제목을 입력하세요.");
				writeForm.title.focus();
				return false;
		}
			if (writeForm.kitname.value.length < 1){
				alert("키트 이름을 입력하세요.");
				writeForm.kitname.focus();
				return false;
		}
				if (writeForm.contents.value.length < 1){
				alert("내용을 입력하세요.");
				writeForm.contents.focus();
				return false;
		}
		return true;
}

$(function(){
    
   
    chnQnaType('1' , '11');
});

function chnQnaType(type , select) {
    
    $('#qnatype').empty();
    
    if(type == '1') { // 상품관련
        $('#qnatype').append("<option value='상품문의' >상품문의</option>'");
        
    } else if (type == '2') {  // 일반관련
        $('#qnatype').append("<option value='이용문의' >이용문의</option>'");
        $('#qnatype').append("<option value='회원문의' >회원문의</option>'");
        $('#qnatype').append("<option value='기타문의' >기타문의</option>'");
    } else if ( type == '3') {  // 주문관련
        $('#qnatype').append("<option value='결제문의' >결제문의</option>'");
        $('#qnatype').append("<option value='주문문의' >주문문의</option>'");
        $('#qnatype').append("<option value='기타문의' >기타문의</option>'");
    }
    document.getElementById("qnatype").style.display = "";
    
    if ($.trim(select) != "") {
        $('#select1').val(type);
        $('#qnatype').val(select);
        
    }
}

</script>
</head>
<body id="page-top">


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

                                <h1>1:1문의</h1>
                            </div>
                            <div class="contact-section">
                                
                                    
                                    <div class="animate" data-animate="fadeInUp">
                                        <form name="writeForm" action="write" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
                                        
                                        	<div class="input-field">
	                                        <select name="questType" id="select1" onChange="chnQnaType(this.value)" >
											    <option value="1">상품관련</option>
											    <option value="2">일반관련</option>
											    <option value="3">주문관련</option>
											</select>    
											<select id="qnatype" name="qnatype"  >
											</select>
											</div>
                                        
                                            <div class="input-field">
                                                <input type="text" class="form-control" id="title" name="title" class="boardSubject" placeholder="제목"/>
												<input type="hidden" id="memberid" name="memberid" value="${memberid}" />
                                            </div>
                                            
                                            <div class="input-field">                                                
												<textarea class="form-control" id="contents" name="contents" placeholder="내용"></textarea>
                                            </div>
                                            
                                            <div class="input-field"> 
                                            <label for="file">파일</label>
											<input type="file" id="file" name="filelist" multiple />
                                            </div>
                                            
                                            <input type="reset" value="재작성" class="btn"/>
											<input type="submit" value="확인" class="btn"/>
											
										</form>
                                        
                                        
                                    </div>
                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    	</div>
</div>






<section class="page-section portfolio" id="portfolio">
            <div class="container">

		
		<div class="content_area">
		<div class="content_top2">

			<h1 align="center"><img src="../resources/img/inquiryicon2.jpg"></h1>
			<!-- Portfolio Section Heading-->
                <h3 class="page-section-heading text-center text-uppercase text-secondary mb-0">
                	문의하기
                </h3>
                <br/>
			<div class="line">
									
			</div>
			<br>
			<br>
			<br>
			<br>
		<div class="wrapper2">
<form name="writeForm" action="write" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">

	<table class="boardWrite">
	
	
	<tr>
    <th>질문유형</th>
	<td>
	    <select name="questType" id="select1" onChange="chnQnaType(this.value)" >
		    <option value="1">상품관련</option>
		    <option value="2">일반관련</option>
		    <option value="3">주문관련</option>
		</select>    
		<select id="qnatype" name="qnatype"  >
		</select>
		
		
	
		
	</td>
	</tr>
	
	
	<tr>
		<th><label for="subject">제목</label></th>
		<td>
		<input type="text" id="title" name="title" class="boardSubject"/>
		<input type="hidden" id="memberid" name="memberid" value="${memberid}" />
		</td>
	</tr>
	
	
	
	
	
	<tr>
		<th><label for="contents">내용</label></th>
		<td><textarea id="contents" name="contents" class="boardContent"></textarea></td>
	</tr>
	<tr>
		<th><label for="file">파일</label></th>
		<td><input type="file" id="file" name="filelist" multiple />
		<span class="date">&nbsp;&nbsp;*&nbsp;임의로 파일명이 변경될 수 있습니다.</span></td>
	</tr>
	</table>
	<br />
	<input type="reset" value="재작성" class="w-btn w-btn-blue"/>
	<input type="submit" value="확인" class="w-btn w-btn-blue"/>
</form>
		</div>



</div>
</div>
</div>
</section>

	
	<script src="../resources/js/bootstrap.min.js"></script>

    <script src="../resources/js/fullpage.min.js"></script>

    <script src="../resources/js/scrolloverflow.js"></script>

	<script src="../resources/js/owl.carousel.min.js"></script>

    <script src="../resources/js/jquery.inview.min.js"></script>

    <script src="../resources/js/custom.js"></script>

</body>
</html>
