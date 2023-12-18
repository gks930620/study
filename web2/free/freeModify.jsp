
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>

<!-- edit에서 넘어온 파라미터는  boNo,boCategory,boWriter ... 등등이 넘어오는데
  넘어온 데이터들은 몇개는 기본적으로 오는거,
  몇개는 사용자가 입력한 값이죠.
  파라미터 한번에 세팅은 쉬움
  -->
<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO"></jsp:useBean>
<jsp:setProperty name="freeBoard" property="*"></jsp:setProperty>

<%
	// 비밀번호로 글쓴사람인지 확인하는 과정은 나중에.... 하고
	//지금은 그냥 글쓴사람확인안하고 넘어온데이터 업데이트 하기.

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	try{
		conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
		StringBuffer sb=new StringBuffer();
		sb.append(" UPDATE free_board SET               ");
		sb.append(" bo_title=?             ,            ");
		sb.append(" bo_category=?          ,            ");
		sb.append(" bo_content=?           ,            ");
		sb.append(" bo_mod_date=sysdate                 ");
		sb.append(" WHERE bo_no= ?                      ");

		pstmt=conn.prepareStatement(sb.toString());

		int index=1;
		pstmt.setString(index++ , freeBoard.getBoTitle());
		pstmt.setString(index++ , freeBoard.getBoCategory());
		pstmt.setString(index++ , freeBoard.getBoContent());
		pstmt.setInt(index++ , freeBoard.getBoNo());

		int row = pstmt.executeUpdate();


	}catch (SQLException e){
		e.printStackTrace();
	}finally {
		if(conn!=null) conn.close();
		if(pstmt!=null) pstmt.close();
		if(rs!=null) rs.close();
	}
%>


		<div class="alert alert-warning">
			해당 글이 존재하지 않습니다.
		</div>	


		<div class="alert alert-warning">
			비밀번호가 틀립니다.
		</div>	
	

		<div class="alert alert-success">
			정상적으로 수정했습니다.
		</div>		
	
		
	<a href="freeView.jsp?boNo=" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;해당 뷰
	</a>	
	
	<a href="freeList.jsp" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>


</body>
</html>