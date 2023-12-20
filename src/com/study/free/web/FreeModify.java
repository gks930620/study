package com.study.free.web;

import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeModify  implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        FreeBoardVO freeBoard = new FreeBoardVO();
        BeanUtils.populate(freeBoard, req.getParameterMap()); //{"boTitle"  : 값  , "boWriter" : 값 }
        req.setAttribute("freeBoard",freeBoard);

        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
        try {
            freeBoardService.modifyBoard(freeBoard);
        } catch (BizPasswordNotMatchedException bnf) {
            req.setAttribute("bnf", bnf);
        }
        return  "free/freeModify";
    }
}
