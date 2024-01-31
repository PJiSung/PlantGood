<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Table 06</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900"
	rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/fullpage.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/owl.carousel.css">
<link rel="stylesheet" href="../resources/css/animate.css">
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<link rel="stylesheet" href="../resources/css/responsive.css">

<link rel="stylesheet" href="/resources/css/style.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	function total(){
		var cost = parseInt(${delivery.cost});
		var length = parseInt(document.getElementById("length").value);
		var sumstock=0;
		var sumprice=0;
		for(var i=1;i<=length;i++){
			sumstock += parseInt(document.getElementById("count"+i).value);
			sumprice += parseInt(document.getElementById("totalprice"+i).value);
			}
			document.getElementById("sumstock").innerHTML = sumstock.toLocaleString("ko-KR")+"개";
			document.getElementById("sumprice").innerHTML = sumprice.toLocaleString("ko-KR")+"원";
			document.getElementById("finalprice").innerHTML = "<span class='pricefont'>"+(sumprice+cost).toLocaleString("ko-KR")+"</span>원";
	}
	
	function count(type,bno,kitname) {
		var cost = parseInt(${delivery.cost});
		var count = document.getElementById("count"+bno).value; 
		var kitprice = document.getElementById("kitprice"+bno).value;
		var length = parseInt(document.getElementById("length").value);
		var kitlength = parseInt(document.getElementById("kitlength").value);
		var sumstock=0;
		var sumprice=0;
		for(var i=1 ; i<=kitlength; i++){
			if(kitname == document.getElementById("kitname"+i).value){
				var kitstock = document.getElementById("kitstock"+i).value;
			}
		}
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
		document.getElementById("count"+bno).value = count;
		document.getElementById("totalprice"+bno).value = count*kitprice;
		document.getElementById("kitstocktxt"+bno).innerHTML = count + "개";
		document.getElementById("totalpricetxt"+bno).innerHTML = "<span class='pricefont'>"+(count*kitprice).toLocaleString("ko-KR")+"</span><span style='color:black'>원</span>";
		
		for(i=1;i<=length;i++){
			sumstock += parseInt(document.getElementById("count"+i).value);
			sumprice += parseInt(document.getElementById("totalprice"+i).value); 
			}
			document.getElementById("sumstock").innerHTML = sumstock.toLocaleString("ko-KR")+"개";
			document.getElementById("sumprice").innerHTML = sumprice.toLocaleString("ko-KR")+"원";
			document.getElementById("finalprice").innerHTML = "<span class='pricefont'>"+(sumprice+cost).toLocaleString("ko-KR")+"<span style='color:black'>원</span>";
		}
	
		function fnCmdDelete(bno) {
			location.href="deletebasket?bno="+bno;
		}
		
		function updatebasket(){
			var length = parseInt(document.getElementById("length").value);
			var bno = 0;
			var kitstock = 0;
			var totalprice=0;
			for (i=1;i<=length;i++){
				bno = document.getElementById("bno"+i).value;
				kitstock = document.getElementById("count"+i).value;
				totalprice = document.getElementById("totalprice"+i).value;
				location.href="orderbasket?bno="+bno+"&kitstock="+kitstock+"&totalprice="+totalprice;
			}
		}
		
		$(document).ready(function(){
			  var currentPosition = parseInt($(".table2").css("top"));
			  $(window).scroll(function() {
			    var position = $(window).scrollTop(); 
			    $(".table2").stop().animate({"top":position+currentPosition+"px"},1000);
			  });
			});
		
</script>
</head>
<body onload="total()">






	<div id="video">
		<header id="header">
			<div class="container-fluid">
				<div class="navbar">
					<a href="/shop/main" id="logo" title="Elegance by TemplateMo">
						Planty Good </a>
					<div class="navigation-row">
						<nav id="navigation">
							<button type="button" class="navbar-toggle">
								<i class="fa fa-bars"></i>
							</button>
							<div class="nav-box navbar-collapse">

								<ul class="navigation-menu nav navbar-nav navbars" id="nav">
									<c:if test="${memberid == null}">
										<!-- 로그인 x -->
										<li><a href="/member/login">Login</a></li>
										<li></li>
										<li><a href="/member/join">Sign Up</a></li>
									</c:if>
									<c:if test="${memberid != null }">
										<!-- 로그인 o -->
										<c:if test="${adminCk == 1}">
											<!-- 관리자 계정 -->
											<li><a href="/Manager/main">관리자 페이지</a></li>
										</c:if>
										<li></li>
										<li><a href="/shop/mypage">마이페이지 </a></li>
										<li></li>
										<li><a href="basket?memberid=${memberid}">장바구니</a></li>
										<li></li>
										<c:if test="${ memberid != null }">
											<li><a href="/member/logout">로그아웃</a></li>
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

			<div class="section animated-row">
				<div class="section-inner">
					<div class="row justify-content-center">
						<div class="col-md-7 wide-col-laptop">
							<div class="title-block animate" data-animate="fadeInUp">
								<h1>장바구니</h1>
							</div>

							<div class="contact-section">

							<c:forEach var="kit" items="${kitList}" varStatus="status">
									<input type="hidden" id="kitname${status.count}" value=${kit.kitname}>
									<input type="hidden" id="kitstock${status.count}" value=${kit.kitstock}>
									<c:if test="${status.last}">
										<input type="hidden" id="kitlength" value=${status.count}>
									</c:if>
							</c:forEach>


								<div class="animate" data-animate="fadeInUp">
									<div class="row">
										<div class="col-md-12">
											<div class="table-wrap">

												<table class="table">
													<thead class="thead-primary">
														<tr>
															<th style="text-align: center;width:30%">이미지</th>
															<th style="text-align: center">상품명</th>
															<th style="text-align: center">가격</th>
															<th style="text-align: center">수량</th>
															<th style="text-align: center;width:20%">합계</th>
															<th>&nbsp;</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="basket" items="${basket}"
															varStatus="status">
															<tr class="alert" role="alert">
																<td>
																	<div class="image_wrap"
																		data-kno="${basket.imageList[0].kno}"
																		data-path="${basket.imageList[0].uploadPath}"
																		data-uuid="${basket.imageList[0].uuid}"
																		data-filename="${basket.imageList[0].fileName}">
																		<img>
																	</div>
																</td>
																<td>
																	<span style="color:black">${basket.kitname}</span>
																</td>
																<td><input type="hidden" id="bno${status.count}"
																	value="${basket.bno}">
																	<span style="color:black">
																	<fmt:formatNumber value="${basket.kitprice}" pattern="#,###원" /> 
																	</span>
																	<input type="hidden" id="kitprice${status.count}"
																	value="${basket.kitprice}"></td>
																<td class="quantity">
																	<div class="input-group">
																		<span style="color:black" id="kitstocktxt${status.count}">
																		<fmt:formatNumber value="${basket.kitstock}" pattern="#개" /></span> <input
																			type="hidden" id="count${status.count}"
																			value="${basket.kitstock}"> &nbsp;
																		<button type="button" class="button_quantity"
																			onclick="count('plus',${status.count},'${basket.kitname}')">+</button>
																		<button type="button" class="button_quantity"
																			onclick="count('minus',${status.count},'${basket.kitname}')">-</button>
																	</div>
																</td>
																<td><span id="totalpricetxt${status.count}"><span
																		class="pricefont">${basket.sttotalprice}</span><span style="color:black">원</span></span> <input
																	type="hidden" id="totalprice${status.count}"
																	value=${basket.totalprice}> <c:if
																		test="${status.last}">
																		<input type="hidden" id="length" name="length"
																			value=${status.count}>
																	</c:if>
																<td>
																	<button type="button" class="close"
																		data-dismiss="alert" aria-label="Close"
																		onclick="fnCmdDelete(${basket.bno})">
																		<span aria-hidden="true"><i class="fa fa-close"></i></span>
																	</button>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>







											</div>
										</div>



									</div>




								</div>




							</div>
						</div>
					</div>
				</div>
			</div>
			
			<table class="table2">
				<tr>
					<th class="head" colspan="2"><h3 class="payment">결제 정보</h3></th>
				</tr>
				<tr>
					<td class="paymenttitle">상품수</td>
					<td class="price"><span id="sumstock" class="paymentcontents"></span></td>
				</tr>
				<tr>
					<td class="paymenttitle">상품금액</td>
					<td class="price"><span id="sumprice" class="paymentcontents"></span></td>
				</tr>
				<tr>
					<td class="paymenttitle">배송비</td>
					<td class="price"><span class="paymentcontents"> <fmt:formatNumber
								value="${delivery.cost}" pattern="#,###원" /></span></td>
				</tr>
				<tr>
					<td colspan="2" class="foot"></td>
				</tr>
				<tr>
					<td class="paymenttitle"><span class="paymentfooter">총 결제금액</span></td>
					<td class="price"><span id="finalprice"
						class="paymentcontents"></span></td>
				</tr>
				<tr>
					<th colspan="2"><a href="#" title="Button fade blue/green"
						class="button btnFade btnBlueGreen" onclick="updatebasket()">구매하기</a></th>

				</tr>
			</table>
		</div>
	</div>


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
			
			
		}); 
</script>

<script src="../resources/js/bootstrap.min.js"></script>

    <script src="../resources/js/fullpage.min.js"></script>

    <script src="../resources/js/scrolloverflow.js"></script>

	<script src="../resources/js/owl.carousel.min.js"></script>

    <script src="../resources/js/jquery.inview.min.js"></script>

    <script src="../resources/js/custom.js"></script>

</body>
</html>

