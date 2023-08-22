package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.HeartBoardVO;
import org.joonzis.domain.HeartVO;
import org.joonzis.mapper.HeartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HeartServiceImpl implements HeartService{

	@Autowired
	private HeartMapper mapper;
	
	@Override
	public List<HeartBoardVO> getLikeList(String writer) {
		log.info("get writer : " + writer);
		return mapper.getLikeList(writer);
	}
	
	@Override
	public int insert(HeartVO vo) {
		log.info("getInsert..." + vo);
		
		return mapper.insert(vo);
	}
	
	@Override
	public int deleteLike(HeartVO vo) {
		log.info("deleteLike..."+ vo);
		return mapper.deleteLike(vo);
	}

	@Override
	public int totalLike(long bno) {
		return mapper.totalLike(bno);
	}
	
	@Override
	public int checkLike(HeartVO vo) {
		return mapper.checkLike(vo);
	}
}
