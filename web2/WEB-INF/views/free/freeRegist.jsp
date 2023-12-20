<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page import="com.study.free.service.IFreeBoardService" %>
<%@ page import="com.study.free.service.FreeBoardServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="alert alert-success">
    정상적으로 글이 되었습니다.
</div>
<a href="freeList.wow?" class="btn btn-default btn-sm">
    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
    &nbsp;목록
</a>

</body>
</html>