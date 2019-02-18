package com.spring.helper.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

@Repository
public class UtilDAOImpl implements UtilDAO{

	@Autowired 
	SqlSession sqlSession;
	
	public void imageSearchPro() {
		
	};
	
	//지진 중복 체크
	public int earthQuakeDupCheck(int eqNum) {
		return sqlSession.getMapper(UtilDAO.class).earthQuakeDupCheck(eqNum);
	};
	
	//지진 입력
	public int insertEarthQuake(EarthQuakeVO eVO) {
		return sqlSession.getMapper(UtilDAO.class).insertEarthQuake(eVO);
	}
	
	//지진 가져오기
	public EarthQuakeVO selectEarthQuake(int tmSeq) {
		return sqlSession.selectOne("com.spring.helper.dao.UtilDAO.selectEarthQuakePara",tmSeq);
	}
	
	public EarthQuakeVO selectEarthQuake() {
		return sqlSession.selectOne("com.spring.helper.dao.UtilDAO.selectEarthQuake");
	}
}
