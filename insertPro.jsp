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
