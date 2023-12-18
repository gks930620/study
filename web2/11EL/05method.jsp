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
<%
    UserVO user= new UserVO("hani","하니" , "1004" , "ADMIN");
    request.setAttribute("user" ,user);
%>

EL로 출력 : ${user} <br>
id : ${user.userId} <br>
name : ${user.userName} <br>
이런식으로 출력하는 용도로만 쓰이는데  아주아주가끔 메소드 사용하고
싶을때가 있음
<br><br>
set 전 : ${user.getUserId()} <br>
${user.setUserId("eunchae")}
set 후 : ${user.userId}

 <hr>
마찬가지로 static method도 사용가능
${StringUtils.isEmpty("")} <br>
${StringUtils.isBlank("                        ")} <br>




결론 :
1.EL은 화면출력용으로만 쓰는게 옳음
2.req,session등의 속성을 사용가능
3.사용법만 알면 됨    user.userId
4. EL은 단독으로 사용할 때는 별로 의미가없고 JSTL과 같이 사용할 때
   아주 편리합니다.







</body>
</html>
