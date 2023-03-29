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
			<input name="savename" type="checkBox"><span>작성자 저장</span>
		</div>
		
	</form>

	<!-- <div style="text-align: center; margin-top: 3px;"> -->
	<!-- <input type="button" value="등록하기" id="send" onclick="to_ajax();"> -->
	<button id="send">등록하기</button>
	<!-- </div> -->


	<script type="text/javascript">
	
		$('input[name=writer]').attr('value', window.localStorage.getItem("writer"));
		/* $('input[name=savename]').attr('checked', window.localStorage.getItem("checkBoxBool")); */
		$('input[name=savename]').attr('checked', window.localStorage.getItem("checkBoxBool") === "true");
		console.log(window.localStorage.getItem("checkBoxBool") == "false");
		
		document.getElementById("send").addEventListener("click", function() {

			var queryString = $("#writeBoard").serialize();
			var checkBox = $('input[name=savename]');
			
			const formData = {
					writer : $("input[name=writer]").val(),
					contents : $("textarea[name=contents]").val(),
					title : $("input[name=title]").val()
			}
			
			
			$.ajax({
				type : 'post',
				url : '/boardWrite',
				data : JSON.stringify(formData),
				contentType: "application/json; charset=utf-8;",
				success : function() {
					alert("등록 성공");
					if(checkBox.prop("checked")) {
						window.localStorage.setItem("writer",formData.writer);
						window.localStorage.setItem("checkBoxBool","true");
					}else {
						window.localStorage.setItem("writer","");
						window.localStorage.setItem("checkBoxBool","false");
					}
					
					window.opener.reloadDiv();
					window.close();
				},
				error : function(xhr, status, error) {
					alert("등록 실패");
					window.close();
				}
				
			});
			
		})
	</script>
</body>
</html>