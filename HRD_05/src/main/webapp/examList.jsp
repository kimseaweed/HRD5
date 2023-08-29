<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h3> 학생 성적 </h3>
<table border="1"> 
<tr>
<th>학년</th>
<th>반</th>
<th>번호</th>
<th>이름</th>
<th>국어</th>
<th>수학</th>
<th>영어</th>
<th>역사</th>
<th>합계</th>
<th>평균</th>
<th>순위</th>
</tr>

<%
List<RankDTO> list = new DAO().getRank();
for(RankDTO dto : list){
%>
<tr>

<td><%=dto.getYear() %></td>
<td><%=dto.getGrade() %></td>
<td><%=dto.getNo() %></td>
<td><%=dto.getSname() %></td>
<td><%=dto.getEkor() %></td>
<td><%=dto.getEmath() %></td>
<td><%=dto.getEeng() %></td>
<td><%=dto.getEhist() %></td>
<td><%=dto.getEsum() %></td>
<td><%=dto.getEavg() %></td>
<td><%=dto.getRank() %></td>

</tr>
<%} %>

<%
List<String> list2 = new DAO().getAvg();

%>
<tr>
<td colspan="4">총합</td>
<td><%=list2.get(0) %></td>
<td><%=list2.get(2) %></td>
<td><%=list2.get(4) %></td>
<td><%=list2.get(6) %></td>
<td><%=list2.get(8) %></td>
<td><%=list2.get(10) %></td>
<td></td>
</tr>
<tr>
<td colspan="4">총평균</td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(1))) %></td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(3))) %></td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(5))) %></td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(7))) %></td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(9))) %></td>
<td><%=String.format("%.2f",Double.parseDouble(list2.get(11))) %></td>

<td></td>
</tr>


</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>