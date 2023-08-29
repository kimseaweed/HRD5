<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<h3>성적입력</h3>
		<form action="action.jsp" name="examForm">
			<table border="1">
				<tr>
					<th>학번</th>
					<td><input name="sno" type="text"></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td><input name="ekor" type="text"></td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input name="emath" type="text"></td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td><input name="eeng" type="text"></td>
				</tr>
				<tr>
					<th>역사점수</th>
					<td><input name="ehist" type="text"></td>
				</tr>


				<tr>
					<td colspan="2"><input value="등록"type="button" onclick="submitData()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function submitData() {
			if (document.examForm.sno.value == "") {
				alert('학번이 입력되지 않았습니다.')
				document.examForm.sno.focus();
			} else if (document.examForm.ekor.value == "") {
				alert('국어점수가 입력되지 않았습니다.')
				document.examForm.ekor.focus();
			} else if (document.examForm.emath.value == "") {
				alert('수학점수가 입력되지 않았습니다.')
				document.examForm.emath.focus();
			} else if (document.examForm.eeng.value == "") {
				alert('영어점수가 입력되지 않았습니다.')
				document.examForm.eeng.focus();
			} else if (document.examForm.ehist.value == "") {
				alert('역사점수가 입력되지 않았습니다.')
				document.examForm.ehist.focus();
			} else {
				document.examForm.submit();
			}

		}
	</script>
</body>
</html>