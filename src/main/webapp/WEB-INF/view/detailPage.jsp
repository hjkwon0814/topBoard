<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>�ۼ���</td>
			<td>${detailBoard.writer}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${detailBoard.title}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${detailBoard.contents}</td>
		</tr>
		<tr>
			<td>�ð�</td>
			<td>${detailBoard.dateTime}</td>
		</tr>
	</table>
</body>
</html>