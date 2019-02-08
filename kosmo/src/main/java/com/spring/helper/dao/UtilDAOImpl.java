package com.spring.helper.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UtilDAOImpl implements UtilDAO{

	@Autowired 
	SqlSession sqlSession;
	
	public void imageSearchPro() {
		
	};
}
