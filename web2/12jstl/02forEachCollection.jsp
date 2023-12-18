<%@ page import="java.util.ArrayList" %>
<%@ page import="com.study.login.vo.UserVO" %>
<%@ page import="org.apache.catalina.User" %>
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
<%
    List<UserVO> newJeans= new ArrayList<>();
    newJeans.add(new UserVO("minji" ,"민지"  ,"1004" ,"LEADER"));
    newJeans.add(new UserVO("hani"  ,"하니"  ,"1004" ,"MEMBER"));
    newJeans.add(new UserVO("daniel","다니엘","1004" ,"MEMBER"));
    newJeans.add(new UserVO("haerin","해린"  ,"1004" ,"MEMBER"));
    newJeans.add(new UserVO("hyein" ,"혜인"  ,"1004" ,"MEMBER"));
    request.setAttribute("newJeans" , newJeans);
%>
<!-- var는 newJeans List의 각각의 원소(UserVO)이고 태그내에서 EL로 사용가능-->
<c:forEach items="${newJeans}"  var="member"  varStatus="status">
    id : ${member.userId}  <br>
    ${status.current==member} <br>
</c:forEach>



</body>
</html>
