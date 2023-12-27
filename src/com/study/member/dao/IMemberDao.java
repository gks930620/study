package com.study.member.dao;

import java.sql.Connection;
import java.util.List;

import com.study.common.vo.PagingVO;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.annotations.Param;

public interface IMemberDao {

    public int getTotalRowCount(@Param("paging")PagingVO paging, @Param("search")MemberSearchVO search);
    public List<MemberVO> getMemberList(@Param("paging")PagingVO paging, @Param("search")MemberSearchVO search);
    public MemberVO getMember(String memId);
    public int updateMember(MemberVO member);
    public int deleteMember(MemberVO member);
    public int insertMember(MemberVO member);

}
