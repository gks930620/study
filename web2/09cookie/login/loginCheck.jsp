<%@page import="com.study.common.util.CookieUtils" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="com.study.login.vo.UserVO" %>
<%@page import="com.study.common.util.UserList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title></title>
</head>
<body>
<!-- <a href="#" class="btn btn-default" onclick="history.go(-1)">뒤로가기</a>
아이디틀렸을때  -->


<%
    String id = request.getParameter("userId");
    String pw = request.getParameter("userPass");
    String save_id = request.getParameter("rememberMe");
    if (save_id == null) {  //아이디기억하기체크안함
        CookieUtils cookieUtils = new CookieUtils(request);
        if (cookieUtils.exists("SAVE_ID")) {
            Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
            response.addCookie(cookie);
        }
        save_id = "";
    }
    boolean nonInput = (id == null || id.isEmpty()) || (pw == null || pw.isEmpty());
    if (nonInput) {
        response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("입력안했어요", "utf-8"));
        //response.sendRedirect(URLEncoder.encode("login.jsp?msg=입력안했어요", "utf-8"));

        return;
    }

    UserList userList = new UserList();
    UserVO user = userList.getUser(id);
    boolean noUser=user==null;
    if (noUser) {
        response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));
        return;
    }

    boolean allCorect=user.getUserPass().equals(pw);
    if (allCorect) {
        if (save_id.equals("Y")) {
            response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
        }
        response.addCookie(CookieUtils.createCookie("AUTH", id));
        response.sendRedirect("login.jsp");
        return;
    }

    //아이디는 맞는데 비번만 다른경우
    response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));


%>


</body>
</html>