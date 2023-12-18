package com.study.free.service;

import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.dao.FreeBoardDaoOracle;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;

import java.util.List;

public class FreeBoardServiceImpl  implements IFreeBoardService{

    IFreeBoardDao freeBoardDao=new FreeBoardDaoOracle();

    @Override
    public List<FreeBoardVO> getBoardList() {
        return freeBoardDao.getBoardList();
    }

    @Override
    public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);  // DB를 정상적으로 실행 했겠지..
        if( freeBoard ==null ) {
            throw  new BizNotFoundException();
        }
        return freeBoard;
    }

    @Override
    public void modifyBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {
    }

    @Override
    public void removeBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {

    }

    @Override
    public void registBoard(FreeBoardVO freeBoard) {

    }


}
