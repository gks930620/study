<%--
  Created by IntelliJ IDEA.
  User: ssam
  Date: 23. 12. 5.
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
  <thead>
    <tr>
      <%
        for(int i=2 ; i<=9 ; i++){
          out.print("<td>" +i +"단 </td>");
        }
      %>
    </tr>
  </thead>
  <tbody>
    <%
      for(int i=1 ; i<=9 ; i++){
        out.print("<tr>");
        for(int j=2 ; j<=9 ; j++){
          out.print("<td>" + j+"X" + i + "=" + j*i);
        }
        out.print("</tr>");
      }
    %>
  </tbody>
</table>

<hr>

<table border="1">
  <thead>
  </tr>
  </thead>
  <tbody>
  <%
    for(int i=2 ; i<=9 ; i++){
      out.print("<tr>");
      for(int j=1 ; j<=9 ; j++){
        out.print("<td>" + i+"X" + j + "=" + j*i);
      }
      out.print("</tr>");
    }
  %>
  </tbody>
  <%
    if(3<5){
      out.print("<table><tbody><tr><td>1</td></tr></tbody></table>");
    }
  %>

  <%
    if(3<5){
  %>

  <table><tbody><tr><td>1</td></tr></tbody></table>

  <%
    }
  %>











</body>
</html>
