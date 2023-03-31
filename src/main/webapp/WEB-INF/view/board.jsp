<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<div id="board">
		<div>
			<select>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select> <input type="text">
			<button>조회</button>
			<button onclick="selectDelete()">선택삭제</button>
		</div>
		<div>
			<table border="1" style="">
				<tr>
					<td><input id="checkAll" type="checkbox"></td>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일시(YYYY-MM-DD HH24.MI.SS)</td>
					<td>비고</td>
				</tr>
				<c:forEach begin="${(page-1) * pageCount}" end="${(pageCount - 1) + ((page - 1) * pageCount)}" var="item" items="${board}" varStatus="status">
					<tr id="${item.id}">
						<td><input id="${item.id}" type="checkbox" name="check"></td>
						<td>${board.size() + 1 - status.count - ((page -1) * pageCount)}</td>
						<td onclick="showPopup('boardDetail', ${item.id})">${item.title}</td>
						<td>${item.writer}</td>
						<td>${item.dateTime}</td>
						<td><button onclick="deleteOne(${item.id})">삭제하기</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<select id="pageCount" onChange="CountPaging()">
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
			</select>
			<button onclick="showPopup('boardWritePopup')">작성하기</button>
		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:set var="pageC" value="${board.size()%pageCount eq 0 ? (board.size()/pageCount) -1 : board.size()/pageCount}"></c:set>
				<c:forEach begin="0" end="${pageC}" varStatus="status">
					<li class="page-item" value="${status.count}"><a class="page-link">${status.count}</a></li>
				</c:forEach>				
			</ul>
		</nav>
	</div>


	<script>
	
		$('.pagination li').on('click', function(e) {
			var pageCount = $("#pageCount option:selected").val();
			var page = $(this).val();
			$.ajax({
				type : 'get',
				url : "/" + page + "/" + pageCount,
				success : function() {
					$('#board').load("/" + page + "/" + pageCount + '#board');
					$("#pageCount").val(pageCount).prop("selected", true);
				},
				error : function(xhr, status, error) {
					alert("실패");
				}
				
			});
		})
	
		// select option value 선택
		$("#pageCount").val(${pageCount}).prop("selected", true);
		
		// 팝업 창 띄우기
		function showPopup(openURL, id) {
			if(arguments.length == 2) {
				var windowOpen = window.open(openURL + "/" + id, "팝업 테스트",
				"width=400, height=300, top=10, left=10");
			}else {
				var windowOpen = window.open(openURL, "팝업 테스트",
				"width=400, height=300, top=10, left=10");	
			}			
		}

		// 부분 렌더링
		function reloadDiv() {
			$('#board').load(location.href + '#board');
		}
		
		
		// 체크
		$(function() {
			$("#checkAll").click(function() {
				if($("#checkAll").is(":checked")) $("input[name=check]").prop("checked", true);
				else $("input[name=check]").prop("checked", false);
			});
			
			$("input[name=check]").click(function() {
				var total = $("input[name=check]").length;
				var checked = $("input[name=check]:checked").length;

				if(total != checked) $("#checkAll").prop("checked", false);
				else $("#checkAll").prop("checked", true); 
			});
		})
		
		//일반 삭제
		
		function deleteOne(id) {
			
			if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : 'post',
					url : '/deleteBoard/' + id,
					contentType: "application/json; charset=utf-8;",
					success : function() {
						alert("삭제 성공");
						reloadDiv();
					},
					error : function(xhr, status, error) {
						alert("삭제 실패");
					}
					
				});
			} else {
				alert("취소");
			}
		}
		
		// 선택 삭제
		function selectDelete() {
			var url = "selectDeleteBoard";
			var boardIdList = new Array();
			var list = $("input[name=check]");
			for(var i = 0; i<list.length; i++) {
				if(list[i].checked) {
					boardIdList.push(list[i].id);
				}
			}
			
			const listData = {
				IdList : boardIdList
			}
			
			if(boardIdList.length == 0) {
				alert("선택된 글이 없습니다.");
			} else {
				var alertDelete = confirm("정말 삭제 하시겠습니까?");
				$.ajax({
					url : url,
					type : "POST",
					data : listData,
					success : function(data) {
						alert("삭제 성공");
						reloadDiv();
					},
					error : function(xhr, status, error) {
						alert("삭제 실패");
					}
				})
			}
		}
		
		function CountPaging() {
			var pageCount = $("#pageCount option:selected").val();
			var page = ${page};
			
			$('#board').load("/" + page + "/" + pageCount + '#board');
		}
		
		function paging() {
			var pageCount = $("#pageCount option:selected").val();
			var page = ${page};
			console.log(pageCount);
			console.log(page);
			$.ajax({
				type : 'get',
				url : "/" + page + "/" + pageCount,
				success : function() {
					$('#board').load("/" + page + "/" + pageCount + '#board');
					$("#pageCount").val(pageCount).prop("selected", true);
				},
				error : function(xhr, status, error) {
					alert("실패");
				}
				
			});
		}
	</script>
</body>
</html>