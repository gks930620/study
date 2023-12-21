package com.study.member.service;

import com.study.common.util.MybatisSqlSessionFactory;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class MemberServiceImpl implements IMemberService {

    SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    @Override
    public List<MemberVO> getMemberList() {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {    // try-with resource
            IMemberDao memberDao = session.getMapper(IMemberDao.class);
            return memberDao.getMemberList();
        }
    }

    @Override
    public MemberVO getMember(String memId) throws BizNotFoundException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {    // try-with resource
            IMemberDao memberDao = session.getMapper(IMemberDao.class);
            MemberVO member = memberDao.getMember(memId);
            if (member == null) {
                throw new BizNotFoundException();
            }
            return member;
        }
    }

    @Override
    public void modifyMember(MemberVO member) throws BizPasswordNotMatchedException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {    // try-with resource
            IMemberDao memberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = memberDao.getMember(member.getMemId());

            if (vo.getMemPass().equals(member.getMemPass())) {
                memberDao.updateMember(member);
            } else {
                throw new BizPasswordNotMatchedException("member update 비밀번호 틀림. 사용자 아님");
            }
        }
    }

    @Override
    public void removeMember(MemberVO member) throws BizPasswordNotMatchedException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {    // try-with resource
            IMemberDao memberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = memberDao.getMember(member.getMemId());

            if (vo.getMemPass().equals(member.getMemPass())) {
                memberDao.deleteMember(member);
            } else {
                throw new BizPasswordNotMatchedException("member delete 비밀번호 틀림. 사용자 아님");
            }
        }
    }

    @Override
    public void registMember(MemberVO member) throws BizDuplicateKeyException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {    // try-with resource
            IMemberDao memberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = memberDao.getMember(member.getMemId());

            if (vo == null) {
                memberDao.insertMember(member);
            } else {
                throw new BizDuplicateKeyException("아이디가 중복되어 회원가입이 되지 않습니다.");
            }
        }

    }
}
