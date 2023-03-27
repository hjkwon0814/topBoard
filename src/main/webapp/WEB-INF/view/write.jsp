<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

	<!-- <div style="text-align: center; margin-top: 3px;"> -->
	<!-- <input type="button" value="등록하기" id="send" onclick="to_ajax();"> -->
	<button id="send">등록하기</button>
	<!-- </div> -->


	<script type="text/javascript">
		function insert() {
			
			
			return true;
		}
		
		document.getElementById("send").addEventListener("click", function() {

			var queryString = $("#writeBoard").serialize();
			
			const formData = {
					writer : $("input[name=writer]").val(),
					contents : $("textarea[name=contents]").val(),
					title : $("input[name=title]").val()
			}
			
			console.log(formData);
			
			$.ajax({
				type : 'post',
				url : '/boardWrite',
				data : JSON.stringify(formData),
				contentType: "application/json; charset=utf-8;",
				dataType : "json",
				success : function() {
					window.opener.reloadDiv();
					window.close();
				},
				error : function(xhr, status, error) {
					console.log(error);/* 
					window.opener.reloadDiv();
					window.close(); */
				}
				
			});
			
			
			
		})
	</script>
</body>
</html>