<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ssam
  Date: 23. 12. 7.
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String idol = request.getParameter("idol");
    List<String> members=new ArrayList<>();
    if(idol.equals("n")){
        members.add("김민지");
        members.add("팜하니");
        request.setAttribute("members" , members);
        pageContext.forward("04newJeans.jsp");

    }else if(idol.equals("i")){
%>
    <jsp:forward page="04ive.jsp"></jsp:forward>

<%
    }else{
        //르세라핌으로
    }
%>




</body>
</html>
