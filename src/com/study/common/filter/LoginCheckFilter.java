package com.study.common.filter;

import com.study.login.vo.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/login/login.wow")
public class LoginCheckFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpSession session=request.getSession();
        HttpServletResponse response=(HttpServletResponse) servletResponse;

        UserVO user = (UserVO)session.getAttribute("USER_INFO");
        if(user!=null){  //로그인 된 상태
            response.getWriter().println("you have been logined");
            return;
        }else{ //로그인 안된 상태
            filterChain.doFilter(servletRequest,servletResponse);
        }

    }
}
