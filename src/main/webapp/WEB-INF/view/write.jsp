<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="/boardWrite" method="post" id="writeBoard"
		name="writeBoard">
		<div>
			<span>제목 : </span><input name="title" type="text"><br />
		</div>
		<div>
			<span>내용 : </span>
			<textarea name="contents" cols="50" rows="10"></textarea>
		</div>
		<div>
			<span>작성자 : </span><input name="writer" type="text">
		</div>
	</form>

	<div style="text-align: center; margin-top: 3px;">
		<input type="button" value="등록하기" id="send" onclick="to_ajax();">
	</div>
	<script>
		function fn_insert() {
			
			
			alert("되간함?");
			/* window.close(); */
			return true;
		}
		
		function sendData() {
			alert("글 작성 되었습니다.");
			console.log("들어오긴함?");
			document.getElementById("writeBoard").submit();
		}
		
		function to_ajax() {
			var queryString = $("writeBoard").serialize();
			
			$.ajax({
				type : 'post',
				url : '/boardWrite',
				data : queryString,
				dataType = "json",
				error : function(xhr, status, error) {
					alert(error);
				},
				success : function(json) {
					alert(json);
				}
			});
		}
	</script>
</body>
</html>