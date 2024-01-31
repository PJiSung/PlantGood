<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${memberid == null}">
						<!-- 로그인 x -->
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>
					<c:if test="${memberid != null }">
						<!-- 로그인 o -->
						<c:if test="${adminCk == 1}">
							<!-- 관리자 계정 -->
							<li><a href="/Manager/main">관리자 페이지</a></li>
						</c:if>
						<li>
							<a href="/shop/mypage">마이페이지  </a>
					</li>
					<li>
						<a href="basket?memberid=${memberid}">장바구니</a>
					</li>
					</c:if>
				</ul>
			</div>
			<div class="top_area">
				<!-- 로고영역 -->
				<div class="logo_area">
					<a href="/shop/main"><img src="../resources/img/downLogo.png"></a>
				</div>
				<div class="search_area"></div>

				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${memberid == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${ memberid != null }">
						<div class="login_success_area">
							<span>회원 : ${userName}</span> <a href="/member/logout">로그아웃</a>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			</div>