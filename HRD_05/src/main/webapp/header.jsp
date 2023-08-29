<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	padding: 0; margin: 0;
}
body{
	background-color: lightgray;
}
header,footer{
	background-color: gray;
}
nav{
	background-color: darkgray;
}
h1,h2,h3{
	text-align: center;
	padding: 20px 30px;
}

section{
padding-bottom: 200px;
}

footer{
position: absolute;
bottom: 0;
width:100vw;
}

ul{
display: flex;
}
li{
padding: 15px 20px;
list-style: none;
}
a{
text-decoration: none;
}

table{
text-align: center;
margin: 20px auto;
}
th, td{
padding: 15px 20px;
}
</style>
</head>
<body>
<header> <h1>학사관리 프로그램</h1> </header>
<nav><ul>
<li> <a href="studentList.jsp">학생목록</a> </li>
<li> <a href="examInsert.jsp">성적입력</a> </li>
<li> <a href="examList.jsp">학생성적</a> </li>
<li> <a href="index.jsp">홈으로</a> </li>
</ul> </nav>
</body>
</html>