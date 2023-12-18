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
<!--  gugudan  구구단 테이블 jstl을 이용해서 만들어보세요 -->


<!-- jstl을 이용해서 별 그리기
    *         *****             *
   **          ****            ***
  ***           ***           *****
 ****            **          *******
*****             *         *********
-->

<!--
jstl을 이용해서 prodList , prodView 완성해보기
forEach  i, j 사용해도 되고
items  ( List<ProdVO)  )  사용해도 됩니다.
-->
<table border="1">
<c:forEach  begin="1" end="9" var="i">
        <tr>
    <c:forEach begin="2" end="9" var="j">
        <td> ${j} X ${i} = ${j*i}  </td>
    </c:forEach>
        </tr>
</c:forEach>
</table>

<c:forEach begin="0" end="4" var="i">
    <c:forEach begin="0" end="${4-i}" var="j">
        &nbsp
    </c:forEach>

    <c:forEach begin="0" end="${i}" var="j">
        *
    </c:forEach>
        <br>
</c:forEach>

<hr>
<c:forEach begin="0" end="4" var="i">
    <c:forEach begin="0" end="${i}" var="j">
        &nbsp
    </c:forEach>

    <c:forEach begin="0" end="${4-i}" var="j">
        *
    </c:forEach>
    <br>
</c:forEach>

<hr>
<c:forEach begin="0" end="4" var="i">
    <c:forEach begin="0" end="${4-i}" var="j">
        &nbsp
    </c:forEach>

    <c:forEach begin="0" end="${2*i}" var="j" >
        *
    </c:forEach>
    <br>
</c:forEach>


</body>
</html>
