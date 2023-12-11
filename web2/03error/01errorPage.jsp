<%@ page contentType="text/html;charset=UTF-8" language="java"
     isErrorPage="true"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
01errorMain 실행하다가 에러가 나면  이 화면이 대신 보입니다
<br>

에러정보는 다음을 참고하세요 <br>
<%=exception.getClass().getSimpleName() %>

</body>
</html>
