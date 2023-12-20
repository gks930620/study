package com.study.login.web;

import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String method = req.getMethod();
        if(method.equals("GET")){

        }else{

        }


        return null;
    }
}
