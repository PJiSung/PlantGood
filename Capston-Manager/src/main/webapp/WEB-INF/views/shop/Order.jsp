<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">

<title>상품주문</title>
		<link rel="stylesheet" href="/resources/css/shop/goodsorder.css">
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function OrderNo() {
		var today = new Date();
		var random = Math.floor(Math.random() * 100 + 1)
		var year = today.getFullYear().toString().substr(-2)
		var month = today.getMonth() + 1;
		var day = today.getDate();
		var OrderNo = year + (("00" + month.toString()).slice(-2))
				+ (("00" + day.toString()).slice(-2)) + random;
		document.OrderForm.orderno.value = OrderNo;
	}

	function Order() {
		var test = 0;
		var name = "${customer.name}";
		var orderno = document.getElementById("orderno").value;
		var bankname = document.getElementById("bankname").value;
		var memberid = "${memberid}";
		var totalcost = parseInt(document.getElementById("totalcost").value);
		var basketlength = document.getElementById("basketlength").value;
		var stock = document.getElementById("stock").value;
		var splitstock = stock.split(",");
		for (var i = 1; i <= basketlength; i++) {
			var kitname = document.getElementById("kitname" + i).value;
			var kitprice = document.getElementById("kitprice" + i).value;
			var kitstock = document.getElementById("count" + i).value;
			var kno = document.getElementById("kno" + i).value;
			location.href = "addOrder?kitname=" + kitname + "&name=" + name
					+ "&kitprice=" + kitprice + "&orderno=" + orderno
					+ "&bankname=" + bankname + "&memberid=" + memberid
					+ "&kitstock=" + kitstock + "&totalcost=" + totalcost
					+ "&kno=" + kno;
			location.href = "updatekit?kno=" + kno + "&stock="
					+ splitstock[i - 1];
		}
	}

	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("raddr2").value = extraAddr;
				} else {
					document.getElementById("raddr2").value = '';
				}
				document.getElementById("rzip").value = data.zonecode;
				document.getElementById("raddr1").value = addr;
				document.getElementById("raddr2").focus();
			}
		}).open();
	}

	function Totalcost() {
		var kitprice = 0;
		var basketlength = document.getElementById("basketlength").value;
		var cost = parseInt(document.getElementById("cost").value);

		for (var i = 1; i <= basketlength; i++) {
			kitprice += parseInt(document.getElementById("totalprice" + i).value);
		}

		document.OrderForm.totalcost.value = kitprice + cost;
		document.getElementById("pricetxt").innerHTML = kitprice
				.toLocaleString("ko-KR")
				+ "원";
		document.getElementById("totalpricetxt").innerHTML = "<span class='pricefont'>"
				+ (kitprice + cost).toLocaleString("ko-KR") + "</span>원";

	}

	function InputInfo() {
		var name = document.getElementById("name").value;
		var zip = document.getElementById("zip").value;
		var addr1 = document.getElementById("addr1").value;
		var addr2 = document.getElementById("addr2").value;
		var phone = document.getElementById("phone").value;
		var areanum = phone.substring(0, 3);
		var front = phone.substring(3, 7);
		var back = phone.substring(7, 11);
		var PhoneNum = areanum + front + back;
		if (document.getElementById("text").checked) {
			document.OrderForm.front.value = "";
			document.OrderForm.back.value = "";
			document.OrderForm.rname.value = "";
			document.OrderForm.rzip.value = "";
			document.OrderForm.raddr1.value = "";
			document.OrderForm.raddr2.value = "";
		} else if (document.getElementById("save").checked) {
			document.OrderForm.front.value = front;
			document.OrderForm.back.value = back;
			document.OrderForm.rname.value = name;
			document.OrderForm.rzip.value = zip;
			document.OrderForm.raddr1.value = addr1;
			document.OrderForm.raddr2.value = addr2;
			document.OrderForm.rphone.value = PhoneNum;
		}
	}

	function GetimdId(clickid) {
		bankname.value = clickid;
		document.OrderForm.bankname.value = clickid;
	}

	function getstock() {
		var basketlength = document.getElementById("basketlength").value;
		var kitlength = document.getElementById("kitlength").value;
		var stock = "";
		var totalcount = 0;
		for (var i = 1; i <= basketlength; i++) {
			var kitname = document.getElementById("kitname" + i).value;
			var count = parseInt(document.getElementById("count" + i).value);
			totalcount += parseInt(document.getElementById("count" + i).value);
			for (var j = 1; j <= kitlength; j++) {
				if (kitname == document.getElementById("kit" + j).value) {
					if (i == basketlength) {
						stock += parseInt(document.getElementById("kitstock"
								+ j).value)
								- count;
					} else {
						stock += parseInt(document.getElementById("kitstock"
								+ j).value)
								- count + ",";
					}
				}
			}
		}
		document.OrderForm.stock.value = stock;
		document.getElementById("totalcount").innerHTML = totalcount;
	}

	$(document).ready(function() {
		var currentPosition = parseInt($(".div1").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$(".div1").stop().animate({
				"top" : position + currentPosition + "px"
			}, 1000);
		});
	});
</script>

</head>
<body onload="OrderNo();Totalcost();getstock()">




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
        
        	<div class="section animated-row">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-7 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <h1>주문/결제</h1>
                            </div>
                            
                            <div class="contact-section">
                                <div class="animate" data-animate="fadeInUp">
                                
                                
                                
  <form:form id="OrderForm" name="OrderForm" action="addSave" method="post">
		<!-- Orderer 테이블 insert -->
		<input type="hidden" name="orderno" id="orderno">
		<input type="hidden" name="name" id="name" value="${customer.name}">
		<input type="hidden" name="phone" id="phone" value="${customer.phone}">
		<input type="hidden" name="zip" id="zip" value="${customer.zip}">
		<input type="hidden" name="addr1" id="addr1" value="${customer.addr1}">
		<input type="hidden" name="addr2" id="addr2" value="${customer.addr2}">
		<input type="hidden" name="email" id="email" value="${customer.email}">
		<input type="hidden" name="memberid" id="memberid" value="${memberid}">
		<input type="hidden" name="totalcost" id="totalcost">
		<input type="hidden" name="stock" id="stock">
		<input type="hidden" name="cost" id="cost" value="${delivery.cost}">
		<input type="hidden" id="rphone" name="rphone">

		<c:forEach var="basket" items="${basket}" varStatus="status">
			<input type="hidden" name="kitname${status.count}"
				id="kitname${status.count}" value="${basket.kitname}">
			<input type="hidden" name="kitprice${status.count}"
				id="kitprice${status.count}" value="${basket.kitprice}">
			<input type="hidden" name="totalprice${status.count}"
				id="totalprice${status.count}" value=${basket.totalprice}>
			<input type="hidden" name="count${status.count}"
				id="count${status.count}" value="${basket.kitstock}">
			<input type="hidden" name="kno${status.count}"
				id="kno${status.count}" value="${basket.kno}">
			<c:if test="${status.last}">
				<input type="hidden" id="basketlength" name="basketlength"
					value=${status.count}>
			</c:if>
		</c:forEach>

		<c:forEach var="kit" items="${kit}" varStatus="status">
			<input type="hidden" name="kit${status.count}"
				id="kit${status.count}" value="${kit.kitname}">
			<input type="hidden" name="kitstock${status.count}"
				id="kitstock${status.count}" value="${kit.kitstock}">
			<c:if test="${status.last}">
				<input type="hidden" id="kitlength" name="kitlength"
					value=${status.count}>
			</c:if>
		</c:forEach>



		<div class="background">
		<table class="centerpos">
			<tr>
				<td>
					<h3>배송정보</h3>
					<hr>
				</td>
			</tr>
			<tr>
				<td style="text-align:center;">
				<div class="container">
						<ul>
							<li><input type="radio" id="text" name="orderinfo"
								onclick="InputInfo()" checked> <label for="text">직접
									입력</label>

								<div class="check"></div></li>

							<li><input type="radio" id="save" name="orderinfo"
								onclick="InputInfo()"> <label for="save">기존 배송지</label>

								<div class="check"></div></li>
						</ul>
					</div></td>
			</tr>
			<tr>
				<td><input type="text" class="form-field" id="rname"
					name="rname" placeholder="받는 사람"></td>
			</tr>
			<tr>
				<td><select id="areanum" name="areanum" class="form-field">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
				</select> <input type="text" class="phone" id="front" name="front"
					placeholder="휴대폰 앞자리"> <input type="text"
					class="phone" id="back" name="back" placeholder="휴대폰 뒷자리"></td>
			</tr>
			<tr>
				<td><input type="text" class="form-field" id="rzip" name="rzip"
					placeholder="우편번호"><a href="javascript:;"
					Onclick='DaumPostcode()'><img
						src="${pageContext.request.contextPath}/resources/img/btn_postsearch.gif"
						border=0 align=absmiddle></a></td>
			</tr>
			<tr>
				<td><input type="text" class="address" id="raddr1"
					name="raddr1" placeholder="기본 주소"></td>
			</tr>
			<tr>
				<td><input type="text" class="address" id="raddr2"
					name="raddr2" placeholder="상세 주소"></td>
			</tr>
			<tr>
				<td><input type="hidden" id="bankname" name="bankname"></td>
			</tr>
		</table>
		<br>
		<div class="centerpos">
			<h3>결제수단</h3>
			<hr>
			<div class="wrapper2">
				<input type="radio" name="payment" id="option-1" checked> <input
					type="radio" name="payment" id="option-2"> <label
					for="option-1" class="option option-1"> <span>무통장 입금</span>
				</label> <label for="option-2" class="option option-2"> <span>신용/체크카드</span>
				</label>
			</div>
		</div>
		<table class="centerpos table3">
			<tr>
				<td><input type="hidden" id="payment" name="payment"
					value="무통장입금" checked></td>
			</tr>
			<tr>
				<th><input type="radio" name="bankname" id="option-a">
					<label for="option-a" class="option option-a"> <img
						src="<c:url value='/resources/img/bank/국민.png'/>" width="200"
						height="70" alt="" id="국민은행" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-b">
					<label for="option-b" class="option option-b"> <img
						src="<c:url value='/resources/img/bank/신한.png'/>" width="200"
						height="70" alt="" id="신한은행" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-c">
					<label for="option-c" class="option option-c"> <img
						src="<c:url value='/resources/img/bank/우리.png'/>" width="200"
						height="70" alt="" id="하나은행" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-d">
					<label for="option-d" class="option option-d"> <img
						src="<c:url value='/resources/img/bank/새마을.png'/>" width="200"
						height="70" alt="" id="새마을금고" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-e">
					<label for="option-e" class="option option-e"> <img
						src="<c:url value='/resources/img/bank/IBK.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
			</tr>
			<tr>
				<th><input type="radio" name="bankname" id="option-f">
					<label for="option-f" class="option option-f"> <img
						src="<c:url value='/resources/img/bank/대구.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-g">
					<label for="option-g" class="option option-g"> <img
						src="<c:url value='/resources/img/bank/전북.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-h">
					<label for="option-h" class="option option-h"> <img
						src="<c:url value='/resources/img/bank/수협.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-i">
					<label for="option-i" class="option option-i"> <img
						src="<c:url value='/resources/img/bank/NH.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
				<th><input type="radio" name="bankname" id="option-j">
					<label for="option-j" class="option option-j"> <img
						src="<c:url value='/resources/img/bank/KEB.png'/>" width="200"
						height="70" alt="" onclick="GetimdId(this.id)"></label></th>
			</tr>
		</table>
		</div>
	</form:form>    
	                            
                                
                                
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <div class="div1">
			<table class="table2 bottomborder">
				<tr>
					<td class="lineheight"><h4>
							 주문상품&nbsp;<span id="totalcount"></span>개
						</h4></td>
				</tr>
			</table>

			<div class="div2">
				<table>
					<c:forEach var="basket" items="${basket}" varStatus="status">
						<tr>
							<td>
								<table>
									<tr>
										<td>
											<div class="image_wrap" data-kno="${basket.imageList[0].kno}"
												data-path="${basket.imageList[0].uploadPath}"
												data-uuid="${basket.imageList[0].uuid}"
												data-filename="${basket.imageList[0].fileName}">
												<img>
											</div>
										</td>
										<td>${basket.kitname}<br> ${basket.stkitprice}원<br>
											<fmt:formatNumber value="${basket.totalprice}"
												pattern="#,###원" /> / ${basket.kitstock}개
										</td>
									</tr>

								</table>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<table class="table2">
				<tr>
					<td colspan="2" class="foot"></td>
				</tr>
				<tr>
					<td class="paymenttitle">상품금액</td>
					<td class="price"><span id="pricetxt" class="paymentcontents"></span></td>
				</tr>
				<tr>
					<td class="paymenttitle">배송비</td>
					<td class="price"><span class="paymentcontents">${delivery.stcost}원</span></td>
				</tr>
				<tr>
					<td class="paymenttitle"><span class="paymentfooter">최종 결제금액</span></td>
					<td class="price"><span id="totalpricetxt"
						class="paymentcontents"></span></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="javascript:;" title="Button fade blue/green" class="button btnFade btnBlueGreen" onclick="Order();document.getElementById('OrderForm').submit();">구매하기</a></td>
				</tr>
			</table>
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

							/* 이미지 삽입 */
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
