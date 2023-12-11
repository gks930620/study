<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
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

쿠키 삭제 : 쿠키를 삭제하는 메소드는 따로 존재하지 않습니다..
브라우저는 같은이름의 쿠키가 오면 기존에 저장되어있던 쿠키를 삭제하고
새로운 쿠키를 저장합니다.

삭제는 이 새로운 쿠키의 지속시간을 0으로 설정하면 됩니다.

<%
    //new라는 쿠키를 삭제해보자.
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("new")) {  //new라는 쿠키가 있다면
            Cookie newCookie = new Cookie("new", "asdfdasdf");
            newCookie.setMaxAge(0);
            response.addCookie(newCookie);
        }
    }




%>


</body>
</html>
