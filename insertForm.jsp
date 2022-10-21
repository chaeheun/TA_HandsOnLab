<!-- insertForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User registration</title>
</head>
<body>
<h1>사용자 정보 등록</h1>
<form action="insertPro.jsp" method="post">
<p>이름: <input type="text" name="name" ></p>
<p>아이디: <input type="text" name="id" ></p>
<p>패스워드: <input type="text" name="pw" ><p>
<button type="submit">저장</button>
</form>
</body>
</html>
