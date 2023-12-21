package com.study.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebFilter(urlPatterns = "/*")
public class IPCgeckFilter implements Filter {
    private Map<String, Boolean> ipDenyMap=new HashMap<>();
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ipDenyMap.put("192.168.0.11",false);
        ipDenyMap.put("192.168.0.25",false);
        ipDenyMap.put("192.168.0.4",false);
        //192.168.0.4:8080   cmd-> ifconfig
    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)servletRequest;
        String ip = req.getRemoteAddr();
        System.out.println(ip);

        if(ipDenyMap.get(ip)!=null){
            servletRequest.setCharacterEncoding("UTF-8");
            HttpServletResponse response=(HttpServletResponse)servletResponse;
            servletResponse.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("허용되지않는 ip입니다");
            return;
        }

        filterChain.doFilter(servletRequest,servletResponse);

    }
}
