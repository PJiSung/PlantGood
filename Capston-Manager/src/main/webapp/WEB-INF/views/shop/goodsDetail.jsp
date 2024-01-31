<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
<title>플랜티굿</title>
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
        
        	<div class="section animated-row" data-section="slide02">
                <div class="section-inner">
                    <div class="about-section">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 wide-col-laptop">
                                <div class="row">
                                
                                	<div class="col-md-6">
                                        <figure class="about-img animate" data-animate="fadeInUp">
	                                        <div class="image_wrap" data-kno="${kit.imageList[0].kno}" data-path="${kit.imageList[0].uploadPath}" data-uuid="${kit.imageList[0].uuid}" data-filename="${kit.imageList[0].fileName}">
												<img style="width:800px;height:430px;">
											</div>	
                                        </figure>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="about-contentbox">
                                            <div class="animate" data-animate="fadeInUp">
                                            	<h1>${kit.kitname}</h1>
                                                <span>
                                                	수량 : <fmt:formatNumber value="${kit.kitstock}" pattern="# 개" />
                                                	<c:if test="${kit.kitstock == 0}">
														<small align="center" style="color:red">품절</small>
													</c:if>
                                                </span>
                                                <br>                  
                                                <span>
                                                <input type="hidden" id="kitprice" value="${kit.kitprice}">
												판매가 : <span class="discount_price_number"><fmt:formatNumber value="${kit.kitprice}" pattern="#,### 원" /></span> 
                                                </span>
                                                
                                                <hr>
                                                <p>${kit.kitcontents}</p>
                                                
                                                	
													<input type="text" class="form-control" style="width:55px;font-size:17px;margin-right:10px;text-align:center;" id="count" value=1>
														<button class="btn2" onclick="count('plus')">+</button>
														<button class="btn2" onclick="count('minus')">-</button>
													
													<br>
													<br>
													
                                                <input type="hidden" id="kno" name="kno" value="${kit.kno}"/>
													<c:choose>
														<c:when test="${memberid == null}">
														    <a href="/member/login"><input type="button" value="장바구니" class="btn"></a>
															<a href="/member/login"><input type="button" value="바로구매" class="btn"></a>
														</c:when>
														<c:when test="${memberid != null}">
															<c:choose>
															    <c:when test="${kit.kitstock == 0}">
															        <input type="button" value="바로구매" class="btn" disabled>
															    </c:when>
															    <c:when test="${kit.kitstock != 0}">
															    	<a href="#" class="btn" onclick="sendbasket()">장바구니</a>
															        <a href="#" class="btn" onclick="send()">바로구매</a>
															    </c:when>
															    <c:otherwise>
															    </c:otherwise>
															</c:choose>
														</c:when>
													</c:choose>
                                            </div>
                                            
                                            
                                                
                                               
                                                
                                         
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        
    	</div>
</div>




<input type="hidden" id="kitstock" name="kitstock" value=${kit.kitstock}>

        

        
<script src="../resources/js/bootstrap.min.js"></script>

    <script src="../resources/js/fullpage.min.js"></script>

    <script src="../resources/js/scrolloverflow.js"></script>

	<script src="../resources/js/owl.carousel.min.js"></script>

    <script src="../resources/js/jquery.inview.min.js"></script>


    <script src="../resources/js/custom.js"></script>


<script>
$(document).ready(function(){
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("kno")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/shop/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.jpg');
		}
		
	});		
	
	/* 이미지 삽입 
	const bobj = $(".image_wrap");
	
	if(bobj.data("kno")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = uploadPath + "/s_" + uuid + "_" + fileName;
		
		bobj.find("img").attr('src', '/shop/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/goodsNoImage.jpg');
	}	
	*/
	
});	//$(document).ready(function(){


// 수량 버튼 조작
function count(type) {
		var count = document.getElementById("count").value;
		var kitstock = document.getElementById("kitstock").value;
		if (type == 'plus') {
			if (parseInt(count) >= parseInt(kitstock)) {
				count = kitstock;
			} else {
				count = parseInt(count) + 1;
			}
		} else if (type == 'minus') {
			if (parseInt(count) > 0) {
				count = parseInt(count) - 1;
			} else {
				count = 0;
			}
		}
		document.getElementById("count").value = count;
	}

function send(){
	var kitprice = document.getElementById("kitprice").value;
	var kitstock = document.getElementById("count").value;
	var kno = document.getElementById("kno").value;
	var totalprice = kitprice*kitstock;
	location.href="addbasketY?kitname=${kit.kitname}&kitprice=${kit.kitprice}&kitstock="+kitstock+"&totalprice="+totalprice+"&memberid=${memberid}"+"&kno="+kno;
	
}

function sendbasket(){
	var kitprice = document.getElementById("kitprice").value;
	var kitstock = document.getElementById("count").value;
	var kno = document.getElementById("kno").value;
	var totalprice = kitprice*kitstock;
	location.href="addbasket?kitname=${kit.kitname}&kitprice=${kit.kitprice}&kitstock="+kitstock+"&totalprice="+totalprice+"&memberid=${memberid}"+"&kno="+kno;
	var result = confirm("장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?");
	if(result){
	    location.href="basket";
	}else{
	}
}

// 서버로 전송할 데이터
const form = {
		//memberId : '${member.memberId}',
		kno : '${kit.kno}',
}

	
</script>

</body>
</html>