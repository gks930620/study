<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
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
<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO"></jsp:useBean>
<jsp:setProperty name="freeBoard" property="*"></jsp:setProperty>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
        StringBuffer sb = new StringBuffer();
        sb.append("   INSERT INTO free_board (                                                   ");
        sb.append("       bo_no                         , bo_title    , bo_category       ,      ");
        sb.append("       bo_writer                     , bo_pass     , bo_content        ,      ");
        sb.append("       bo_hit                        ,                                        ");
        sb.append("       bo_reg_date                   ,                                        ");
        sb.append("       bo_mod_date                   ,                                        ");
        sb.append("       bo_del_yn                                                              ");
        sb.append("   ) VALUES (                                                                 ");
        sb.append("       seq_free_board.nextval         , ?           , ?                 ,     ");
        sb.append("       ?                              , ?           , ?                 ,     ");
        sb.append("       0                              ,                                       ");
        sb.append("       sysdate                        ,                                       ");
        sb.append("       null                           ,                                       ");
        sb.append("       'N'                                                                    ");
        sb.append("  )                                                                           ");
        pstmt = conn.prepareStatement(sb.toString());

        int index=1;
        pstmt.setString(index++, freeBoard.getBoTitle() );
        pstmt.setString(index++, freeBoard.getBoCategory() );
        pstmt.setString(index++, freeBoard.getBoWriter() );
        pstmt.setString(index++, freeBoard.getBoPass() );
        pstmt.setString(index++, freeBoard.getBoContent() );
        int row=pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (conn != null) conn.close();
        if (pstmt != null) pstmt.close();
        if (rs != null) rs.close();
    }

%>


<div class="alert alert-success">
    정상적으로 글이 되었습니다.
</div>


<a href="freeList.jsp?" class="btn btn-default btn-sm">
    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
    &nbsp;목록
</a>

</body>
</html>