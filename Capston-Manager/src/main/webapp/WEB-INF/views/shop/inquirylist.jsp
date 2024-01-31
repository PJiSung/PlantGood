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
<title>1:1문의</title>
<link rel="stylesheet" href="/resources/css/shop/inqlist.css">
		<!-- Additional CSS Files -->
	    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/font-awesome.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/fullpage.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/owl.carousel.css">
	    <link rel="stylesheet" href="../resources/css/animate.css">
	    <link rel="stylesheet" href="../resources/css/templatemo-style.css">
	    <link rel="stylesheet" href="../resources/css/responsive.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">

function moveAction(where){
	switch (where) {
		case 1:
		location.href = "write";
		break;

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
                                <h1>1:1문의</h1>
                            </div>
                            <div class="contact-section">
                            
                            
                            <div class="animate" data-animate="fadeInUp">
                            
                    	
                    	<input type="hidden" id="memberid" name="memberid" value="${inquiry.memberid}" />
	                    
	                    	<table>
	                    			<tr>
										<th class="th1">NO</th>
	                    				<th class="th2">문의유형</th>
	                    				<th class="th3">제목</th>
	                    				<th class="th4">작성자</th>
	                    				<th class="th6">상태</th>	
	                    				<th class="th5">작성일</th>
	                    			</tr>
	                    		
	                    		<c:forEach var="inquiry" items="${inqList}" varStatus="status">
	                    		<tr onclick="location.href='inqinfo?ino=${inquiry.ino}'" style="cursor:pointer">
	                    		    <td><c:out value="${status.index+1}"></c:out></td> 	        
	                    		    <td><c:out value="${inquiry.qnatype}"></c:out></td>
	                    			<td><c:out value="${inquiry.title}"></c:out></td>
	                    			<td><c:out value="${inquiry.memberid}"></c:out></td>
	                    			<td><c:choose>
										    <c:when test="${inquiry.replycnt >= 1}">
										        <span style="color:red">답변 완료</span>
										    </c:when>
										    <c:when test="${inquiry.replycnt == 0}">
										        <span style="color:blue">답변 대기</span>
										    </c:when>
										    <c:otherwise>
										    </c:otherwise>
										</c:choose></td>		
	                    			<td><c:out value="${inquiry.regdate}"></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    ${pageHttp}
	                    </div>
                            <br>
                            <div class="btn_section">
								<input type="button" value="쓰기" style="width:110px;" class="btn" onclick="moveAction(1)"/>		
							</div>
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
