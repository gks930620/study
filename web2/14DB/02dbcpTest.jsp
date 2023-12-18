<%@ page import="java.sql.*" %>
<%@ page import="com.study.free.vo.FreeBoardVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
02dbcpTest.jsp


<%
    //  1. 로드(서버켜질때 )  2연결, 3쿼리, 4종료

    Connection conn= null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;


    try{
        conn= DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
        pstmt=conn.prepareStatement(" select * from free_board ");
        rs= pstmt.executeQuery();
        List<FreeBoardVO> freeBoardList= new ArrayList<>();
        while (rs.next()){
            FreeBoardVO freeBoard=new FreeBoardVO();
            freeBoard.setBoWriter(rs.getString("bo_writer"));
            freeBoard.setBoTitle(rs.getString("bo_title"));
            freeBoard.setBoNo(rs.getInt("bo_no"));
            freeBoardList.add(freeBoard);
        }
        request.setAttribute("freeBoardList",freeBoardList);
    }catch (SQLException e){
        e.printStackTrace();
    }finally {
        if(conn!=null) conn.close();
        if(pstmt!=null) pstmt.close();
        if(rs!=null) rs.close();
    }
%>
${freeBoardList}






</body>
</html>
