<!-- select.jsp -->

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<style>
table {
        border-collapse: collapse;
}

th {
        width: 100px;
        background-color: rgb(255, 140, 140);
        border-color: black;
}

td {
        text-align: center;
}
</style>
</head>
<body>
        <h1>사용자  목록 조회</h1>
        <table border="1">
                <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                </tr>
                <%
                        // JDBC 참조 변수 준비
                        String url = "jdbc:mariadb:sequential://172.25.1.92:3306, 172.25.1.31:3306/test";
                        String user = "repl", pw = "password";

                        Connection con = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        // 1) JDBC 드라이버 로딩
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // 2) DB연결(DB url, DB id, DB pw)
                        con = DriverManager.getConnection(url, user, pw);
                        
                         // 3) SQL문 준비
                        String sql = "SELECT * FROM users";
                        pstmt = con.prepareStatement(sql);

                        // 4) 실행
                        rs = pstmt.executeQuery();

                        // 5) 결과를 테이블에 출력
                        while (rs.next()) {
                                String id = rs.getString("_id");
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String password = rs.getString("password");
                %>
                <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=email%></td>
                        <td><%=password%></td>
                </tr>
                <%
                        }
                %>
        </table>
        <%
                // JDBC 자원 닫기
                rs.close();
                pstmt.close();
                con.close();
        %>
</body>
</html>
