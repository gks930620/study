package com.study.member.web;

import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
import com.study.servlet.Handler;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberModify implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        MemberVO member = new MemberVO();

        BeanUtils.populate(member, req.getParameterMap());
        req.setAttribute("member", member);

        IMemberService memberService = new MemberServiceImpl();

        memberService.modifyMember(member);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "memberModify 성공", "성공", "/member/memberList.wow", "목록으로 이동");
        req.setAttribute("resultMessageVO", resultMessageVO);
        return "common/message";

    }
}
