<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <ttle>Title</ttle>
    <%
        request.setCharacterEncoding("utf-8");
    %>
</head>
<body>
<%
    //    String name1=request.getParameter("name");  // 첫번째것만..주는걸로 알고있는데....
//    String name2=request.getParameter("name");  //첫번째것만 나오지않나???
    String[] names = request.getParameterValues("name");
    String[] hobbies = request.getParameterValues("hobby");
%>
이름1 : <%= names[0]%>  <br>
이름2 : <%= names[1]%>  <br>
내 취미 <%= Arrays.toString(hobbies)  %>
<hr>

<%
    //request의 모든 파라미터 이름을 알고 싶어요.


%>




</body>
</html>
