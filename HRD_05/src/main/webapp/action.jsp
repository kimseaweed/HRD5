<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%
int result = 
new DAO().setStudent(
request.getParameter("sno"),
request.getParameter("ekor"),
request.getParameter("emath"),
request.getParameter("eeng"), 
request.getParameter("ehist"));

if(result==1){
	out.print("<script> alert('학생 성적이 모두 입력되었습니다'); location.href='index.jsp'</script>");
}else{
	out.print("<script> alert('데이터등록 실패'); location.href='index.jsp' </script>");
}

%>