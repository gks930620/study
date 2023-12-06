<%@ page contentType="text/html;charset=UTF-8" language="java"
   %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//parameter로 한글, eng가 옵니다.
//    request  uri : 05encodingResult.jsp
//             body :  "oc60008" : 사용자가 입력한 값
//                     eng   : 사용자가 입력한 값

    //   request에는 인코딩된 값이 옴
    //   request의 파라미터 이름 + 값 전부 디코딩
    request.setCharacterEncoding("UTF-8");
    //나중에는 필터라는것을 이용해서 인코딩해서 이 코드가 필요가 없긴 한데 필터 쓰기전까지는...

    String 한글 = request.getParameter("한글");
    String eng= request.getParameter("eng");
    System.out.println(한글);
    System.out.println(eng);
    out.print("한글 파라미터 값 : " + 한글 + "<br>");
    out.print("eng 파라미터 값 : " + eng);
%>

<hr>
한글 파라미터 값 : <%=한글%> <br>
eng 파라미터 값 : <%=eng%> <br>








</body>
</html>
