<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    errorPage="01errorPage.jsp"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>


여기는 에러가 발생하는 페이지
<%
    Integer[] arr= new Integer[11];
    //  난 10개만 가지고 무언가 할건데 0번 헷갈려서 크기 11로하고 1번부터 사용할거야
    for(int i= 1 ; i<arr.length ; i++){
        arr[i]= (int)Math.random()*10;  //Random
    }
    Arrays.sort(arr);  //nullPointerException   0번째 1번째랑 비교  큰지작은지 비교
    // null < 1 비교 불가

%>











</body>
</html>
