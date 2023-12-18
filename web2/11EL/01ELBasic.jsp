<%@ page import="com.study.login.vo.UserVO" %>
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
01ELBasic
script언어 : 응용 프로그래밍언어 (JAVA) 를 도와주는 언어.
EL :JSP에서 자바를 도와주는 언어
- 독립된 언어로서 EL만의 문법이 존재.
 + 자바에서의 '특정'객체와 그 내용을 EL에서 사용가능


1. EL 사용법은 예시 보면 아니까 패스
2.  request,session,pageContext 등의 속성(setAttribute)했던 내용을 '화면에 출력'
    2번만 중요

3. 그 외 EL만의 문법은 다 몰라도되는데 한번 맛보긴 할거에요.
<hr>
<br><br><br>
<%
    request.setAttribute("req" , "req");
    session.setAttribute("USER_INFO" ,  new UserVO());
%>
req담은 거 EL로 출력 : ${req}   <br>
session에 담은거 EL로 출력 : ${USER_INFO} <br>














</body>
</html>
