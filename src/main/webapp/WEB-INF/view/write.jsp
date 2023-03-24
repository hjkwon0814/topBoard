<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/boardWrite" method="post">
		<div>
			<span>제목 : </span><input type="text"><br />
		</div>
		<div>
			<span>내용 : </span>
			<textarea cols="50" rows="10"></textarea>
		</div>
		<div>
			<span>작성자 : </span><input type="text">
		</div>
		<div style="text-align: center; margin-top: 3px;">
			<button type="submit">등록하기</button>
		</div>
	</form>
	<script>
		
	</script>
</body>
</html>