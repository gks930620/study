package com.study.code.dao;

import java.util.List;

import com.study.code.vo.CodeVO;

public interface ICommCodeDao {
	public List<CodeVO> getCodeListByParent(String parentCode);
	
}
