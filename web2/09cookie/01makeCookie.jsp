<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
01makeCookie.jsp

<%
    Cookie cookie=new Cookie("new","jeans");  //이름, 값 필수
    response.addCookie(cookie);
    out.print("뉴진스 쿠키를 보냈어요");

%>





</body>
</html>
