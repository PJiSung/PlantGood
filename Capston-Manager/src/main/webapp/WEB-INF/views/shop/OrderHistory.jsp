
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
<script type="text/javascript">
	
</script>
<title>�ֹ� ��ȸ</title>
		<link rel="stylesheet" href="/resources/css/shop/orderhistory.css">
		<!-- Additional CSS Files -->
	    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/font-awesome.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/fullpage.min.css">
	    <link rel="stylesheet" type="text/css" href="../resources/css/owl.carousel.css">
	    <link rel="stylesheet" href="../resources/css/animate.css">
	    <link rel="stylesheet" href="../resources/css/templatemo-style.css">
	    <link rel="stylesheet" href="../resources/css/responsive.css">
	    
<script src="https://code.jquery.com/jquery-3.4.1.js"
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
					                <c:if test = "${memberid == null}">	<!-- �α��� x -->	
										<li>
											<a href="/member/login">Login</a>
										</li>
										<li>
										</li>
										<li>
											<a href="/member/join">Sign Up</a>
										</li>
									</c:if>
									<c:if test="${memberid != null }">	<!-- �α��� o -->		
										<c:if test="${adminCk == 1}">	<!-- ������ ���� -->
											<li>
												<a href="/Manager/main">������ ������</a>
											</li>
										</c:if>	
										<li></li>				
										<li>
												
												<a href="/shop/mypage">����������  </a>
										</li>
										<li></li>
										<li>
											<a href="basket?memberid=${memberid}">��ٱ���</a>
										</li>	
										<li></li>
										<c:if test="${ memberid != null }">
											<li>
												<a href="/member/logout">�α׾ƿ�</a>
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
                                <h1>�ֹ�����</h1>
                            </div>
                            
                            <div class="contact-section">
								<div class="animate" data-animate="fadeInUp">
			
			<div class="contents">
			<div class="ct_center_area">
				<ul>
					<li><div></div><span class="title">��ȸ�Ⱓ</span></li>
					<li><a href="history1W">1����</a></li>
					<li><a href="history1M">1����</a></li>
					<li><a href="history3M">3����</a></li>
					<li><a href="history6M">6����</a></li>
					<li>
					<form action="historySearch">
					<input type="hidden" name="memberid" value="${memberid}">
					<input class="inputdate" type="date" id="start" name="regdate1" min="2022-01-01" max="2022-12-31" >&nbsp;&nbsp;~&nbsp;
					<input class="inputdate" type="date" id="start" name="regdate2" min="2022-01-01" max="2022-12-31" >&nbsp;&nbsp;
					<input type="submit" class="btn1" value="��ȸ�ϱ�">
					</form>
					</li>
				</ul>
				<br><br>
			</div>
			<br>
					<table class="table1">
						<tr class="borderbottom">
							<th>��¥</th>
							<th>��ǰ����</th>
							<th>����</th>
						</tr>
						<c:forEach var="order" items="${order}" varStatus="status">
							<tr class="borderbottom">
								<td>${order.regdate}<br><a href="details?orderno=${order.orderno}">�󼼺���</a></td>
								<td>
									<table>
										<tr>
											<td><input type="hidden" name="kno" value="${order.kno}">
												<div class="image_wrap" data-kno="${order.imageList[0].kno}"
													data-path="${order.imageList[0].uploadPath}"
													data-uuid="${order.imageList[0].uuid}"
													data-filename="${order.imageList[0].fileName}">
													<img>
												</div></td>
											<td>
												<table class="table2">
													<tr>
														<td>${order.kitname}</td>
													</tr>
													<tr>
														<td>���� : <fmt:formatNumber value="${order.kitprice}" pattern="#,###��" /> / ���� : ${order.kitstock}��</td>
													</tr>
													<tr>
														<td>�ֹ���ȣ : ${order.orderno}</td>
													</tr>
													<tr>
														<td>
														<script>
														var price = parseInt(${order.kitprice});
														var kitstock = parseInt(${order.kitstock});
														var sum = (price*kitstock).toLocaleString("ko-KR") + "��";
														document.write(sum);
														</script>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td colspan="2">${order.orderstate}
								<c:if test="${order.orderstate != '�ֹ�����'}">
										<a href="${delivery.link}">���������</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<hr>
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


	<script>
		$(document)
				.ready(
						function() {

							/* �̹��� ���� */
							$(".image_wrap")
									.each(
											function(i, obj) {

												const bobj = $(obj);

												if (bobj.data("kno")) {
													const uploadPath = bobj
															.data("path");
													const uuid = bobj
															.data("uuid");
													const fileName = bobj
															.data("filename");

													const fileCallPath = encodeURIComponent(uploadPath
															+ "/s_"
															+ uuid
															+ "_" + fileName);

													$(this)
															.find("img")
															.attr(
																	'src',
																	'/shop/display?fileName='
																			+ fileCallPath);
												} else {
													$(this)
															.find("img")
															.attr('src',
																	'/resources/img/goodsNoImage.jpg');
												}

											});

						});
	</script>

</body>
</html>