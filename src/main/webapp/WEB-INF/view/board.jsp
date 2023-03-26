<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
		<select>
			<option value="title">제목</option>
			<option value="writer">작성자</option>
		</select> <input type="text">
		<button>조회</button>
		<button>선택삭제</button>
	</div>
	<div id="board">
		<table border="1" style="">
			<tr>
				<td><input id="checkAll" type="checkbox"></td>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일시(YYYY-MM-DD HH24.MI.SS)</td>
				<td>비고</td>
			</tr>
			<c:forEach var="item" items="${board}" varStatus="status">
				<tr>
					<td><input id="${status.count}" type="checkbox"></td>
					<td>${status.count}</td>
					<td>${item.title}</td>
					<td>${item.writer}</td>
					<td>${item.dateTime}</td>
					<td><button>삭제하기</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<select>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
		</select>
		<button onClick="showPopup()">작성하기</button>
	</div>

	<script>
		const openURL = '/boardWritePopup'
		function showPopup() {
			var windowOpen = window.open(openURL, "팝업 테스트",
					"width=400, height=300, top=10, left=10");
		}
		
		function reloadDiv() {
			 $('#divReloadLayer').load(location.href+' #divReloadLayer');
		}

		/* $(function() {
			$("#board").load(window.location.href + "board.jsp");
		}) */
	</script>
</body>
</html>