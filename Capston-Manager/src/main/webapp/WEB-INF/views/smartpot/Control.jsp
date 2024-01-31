<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<title>식물 상태</title>
<script type="text/javascript">
$(function(){)
$('.timepicker').timepicker({
    timeFormat: 'HH:mm',
    interval: 30,
    minTime: '00',
    maxTime: '11:59pm',
    defaultTime: '00',
    startTime: '00:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});
});
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름</td>
		</tr>
		<tr>
			<td>수분</td>
		</tr>
		<tr>
			<td><input type="text" name="humMin" id="humMin"
				placeholder="최소값"><input type="text" name="humMax"
				id="humMax" placeholder="최댓값"></td>
		</tr>
		<tr>
			<td>온도</td>
		</tr>
		<tr>
			<td><input type="text" name="temMin" id="temMin"
				placeholder="최소값"><input type="text" name="temMax"
				id="temMax" placeholder="최댓값"></td>
		</tr>
		<tr>
			<td>LED<input type="text" name="timepicker" id="timepicker"></td>
		</tr>
	</table>
</body>
</html>