<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8");%>
    <title>Title</title>
</head>
<body>
<%
    String newJeanMember = request.getParameter("new");
    newJeanMember.substring(0,2);
%>
내가 좋아하는 멤버 : <%=newJeanMember%>


</body>
</html>
