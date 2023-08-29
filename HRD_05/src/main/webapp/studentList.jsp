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
<h3> 학생 목록 </h3>
<table border="1"> 
<tr>
<th>학번 </th>
<th>이름 </th>
<th>학년 </th>
<th>반 </th>
<th>번호 </th>
<th>성별 </th>
<th>전화번호 </th>
<th>주소 </th>
</tr>

<%
List<StudentDTO> list = new DAO().getStudent();
for(StudentDTO dto : list){
%>
<tr>

<td><%=dto.getSno() %></td>
<td><%=dto.getSname() %></td>
<td><%=dto.getYear() %></td>
<td><%=dto.getGrade() %></td>
<td><%=dto.getNo() %></td>
<td><%=dto.getSgender() %></td>
<td><%=dto.getSphone() %></td>
<td><%=dto.getSaddress() %></td>

</tr>
<%} %>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>