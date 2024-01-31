<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<c:if test="${memberid == null}">
		<!-- 로그인 x -->
		<script type='text/javascript'>
			alert("이 페이지에 접근할 권한이 없습니다");
			location.href = "http://localhost:8080/shop/main";
		</script>
	</c:if>
	<c:if test="${memberid != null }">
		<!-- 로그인 o -->
		<c:if test="${adminCk == 0}">
			<!-- 관리자 계정 -->
			<script type='text/javascript'>
				alert("이 페이지에 접근할 권한이 없습니다");
				location.href = "http://localhost:8080/shop/main";
			</script>
		</c:if>
	</c:if>