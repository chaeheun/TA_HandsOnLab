<!-- insertPro.jsp -->

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User registration ...</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

// 파라미터 정보 가져오기
String name = request.getParameter("name");
String id = request.getParameter("id");
String password = request.getParameter("pw");

//double latitude = Double.parseDouble(stLatitude);
//double longitude = Double.parseDouble(stLongitude);


// JDBC 참조 변수 준비
Connection con = null;
PreparedStatement pstmt = null;
String url = "jdbc:mariadb:sequential://172.25.1.92:3306,172.25.1.31:3306/test";
//String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "repl", pw = "password";
//String driver = "org.mariadb.cj.jdbc.Driver";

// 1) JDBC 드라이버 로딩
//Class.forName("oracle.jdbc.OracleDriver");
Class.forName("org.mariadb.jdbc.Driver");


// 2) DB연결(DB url, DB id, DB pw)
con = DriverManager.getConnection(url, user, pw);

// 3) SQL문 준비
String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, id);
pstmt.setString(3, password);

// 4) 실행
pstmt.executeUpdate();

// JDBC 자원 닫기
pstmt.close();
con.close();
%>
<script>
alert("저장 성공!");
location.href = 'index.jsp';
</script>
</body>
</html>
