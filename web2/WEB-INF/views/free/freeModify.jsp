<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page import="com.study.free.service.IFreeBoardService" %>
<%@ page import="com.study.free.service.FreeBoardServiceImpl" %>
<%@ page import="com.study.exception.BizPasswordNotMatchedException" %>
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

<!-- edit에서 넘어온 파라미터는  boNo,boCategory,boWriter ... 등등이 넘어오는데
  넘어온 데이터들은 몇개는 기본적으로 오는거,
  몇개는 사용자가 입력한 값이죠.
  파라미터 한번에 세팅은 쉬움
  -->


<c:if test="${bnf!=null}">
    <div class="alert alert-warning">
        비밀번호가 틀립니다.
    </div>
</c:if>

<c:if test="${bnf==null}">
    <div class="alert alert-success">
        정상적으로 수정했습니다.
    </div>
    <a href="freeView.wow?boNo=${freeBoard.boNo}" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
        &nbsp;해당 뷰
    </a>
</c:if>


<a href="freeList.wow" class="btn btn-default btn-sm">
    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
    &nbsp;목록
</a>


</body>
</html>