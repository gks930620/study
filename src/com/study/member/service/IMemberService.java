package com.study.member.service;

import java.util.List;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.vo.MemberVO;

public interface IMemberService {

    public List<MemberVO> getMemberList();

    public MemberVO getMember(String memId) throws BizNotFoundException;

    public void modifyMember(MemberVO member) ;

    public void removeMember(MemberVO member) ;

    public void registMember(MemberVO member) throws BizDuplicateKeyException;
}
