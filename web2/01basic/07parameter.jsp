<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String num=request.getParameter("num");
        int intNum= Integer.parseInt(num);


    %>
내년 나이 : <%=intNum+1%>


</body>
</html>
