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
01memberList.jsp,  01memberView.jsp?memId=a002
member 정보들 화면에 출력

쿼리는 그냥 둘다 select * 해도 됩니다.
MemberVO member=new MemberVO();
set하는것도 하고싶은거 2,3개만 해보세요.


</body>
</html>





