<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.stream.Collectors" %>
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
<%
    Cookie[] cookies = request.getCookies();    //ctrl alt v
    for(Cookie cookie : cookies){
        out.print(cookie.getName() + " : " + cookie.getValue() + " <br>");
    }
    out.print("<hr>");


    //특정쿠키로 무언가 하고싶다..
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("han")){
            out.print("han이라는 쿠키를 찾았다 <br>" );
            out.print(cookie.getName() +  " : " + cookie.getValue());
        }
    }
%>

</body>
</html>
