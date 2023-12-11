
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
00errorText.jsp

response 응답 상태 코드
- 200 : 응답이 성공적으로 완료됨
- 300 : 리다이렉트 요청
- 400 : 요청 잘못된 경우 (form태그 잘못해서,  )
- 403 : 허용되지않은 권한
- 404 : not found (03error/01errorMain.jsp로 요청해야되는데 주소 잘못적음)
- 500 : jsp 처리과정 중 자바코드에서 에러남.(서버에러)

500에러는 자바에서 나는 에러니까 여러분들이 아는 exception.
RunTimeException : NullPointerException,ArrayIndexOutofBound, NumberFormatExcetpion
, ClassCastException, /0 했을 때 나는 에러,
runtTime 아닌거 : ClassNotFoundExcpetion

에러가 나서 보이는 파란화면은 개발자한테 꼭 필요한 화면이지만...
사용자가 보게되면 사이트 신뢰성 다운, 코드도 유출되는 등의 문제
그래서 파란에런화면 대신 다른화면을 보여줘야됩니다.


다른화면 보여주는 방법
1. jsp errorPage 지정
2. exception 별로 errorPage 지정
3. 상태코드별로 errorPage 지정


errorPage 우선순위  1,2,3 순번입니다.
우선순위 신경쓰지말고 겹치지 않게 하는게 일반적입니다.


더 중요한거
: 에러페이지는 개발자한테 에러정보를 주기때문에 개발할 때 꼭 보고 고쳐야하는겁니다.
  에러페이지는 개발 마지마~~ㄱ에 설정하는겁니다.









</body>
</html>
