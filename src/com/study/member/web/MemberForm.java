package com.study.member.web;

import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberForm implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        return "member/memberForm";
    }
}
