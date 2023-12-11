<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    System.out.println("요청이 올때마다 콘솔에 출력이됩니다.");
%>

</body>
<script>
    let a=false;
    if(a){
        <% System.out.println( "출력이 될까요 안될까요??");%>
        alert("얼럿은 안떠요");
    }
</script>

</html>
