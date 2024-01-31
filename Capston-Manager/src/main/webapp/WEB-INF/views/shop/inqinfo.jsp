<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<configuration>
    <settings>
        <setting name="jdbcTypeForNull" value="NULL"/>
    </settings>
</configuration>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
<title>1:1문의</title>
<link rel="stylesheet" href="/resources/css/shop/inqinfo.css">
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



function moveAction(where) {
	switch (where) {
	case 1:
		location.href = "inqmain";
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
                                <h1>문의 상세</h1>
                            </div>
                            <div class="contact-section">
                            
                            <div class="animate" data-animate="fadeInUp">
                            
							
													
								<table>
								<tr>
									<th>제목</th>
									<td>${inq.title}</td>
									<th>문의유형</th>
									<td>${inq.qnatype}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${inq.memberid}</td>
									<th>작성일</th>
									<td>${inq.regdate}</td>
								</tr>

								
								<tr>
									<td colspan="4" style="text-align:start;padding-left:10px;"><pre><c:out value="${inq.contents}"/></pre><br/><br/></td>
								</tr>
								<tr>
								<td>첨부파일</td>
									<td colspan="4">
									<c:forEach var="file" items="${fileList}">
									         <a href="filedown?fileName=${file.ofilename}" class="fileview">
											<font size="2px">${file.ofilename}</font>
									         <font size="2px">(${file.filesize} byte)</font><br> </a> 
									</c:forEach>
									<c:if test="${empty fileList}">
									       <font color="#A6A6A6" size="2px"> 첨부된 파일이 없습니다. </font>
									</c:if>
									</td>
								</tr>

									<tr><th colspan="4">관리자 답변</th></tr>
									<c:forEach var="reply" items="${replyList}">
									  <tr><td>
											${reply.managerid}
											</td>
											<td colspan="3">
											<span class="date">${reply.regdate}</span>
											<p>${reply.contents}</p>
											</td>
											</tr>
									</c:forEach>
								</table>
								 <input style="float:left" type="button" value="목록" class="btn" onclick="location.href='inquirylist'">         
									
									</div>
									</div>
									
									<br />
									<br>
									<br>
									<br>
									<br>
									<br>
										
										
									</div>	<!-- class="wrap" -->
								</div>	<!-- class="wrapper" -->
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

