package org.joonzis.service;

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
	public int insert(HeartVO vo) {
		log.info("getInsert..." + vo);
		
		return mapper.insert(vo);
	}
	
	@Override
	public int searchLike(HeartVO vo) {
		log.info("searchLike..."+ vo);
		return mapper.searchLike(vo);
	}
	
	@Override
	public int deleteLike(HeartVO vo) {
		log.info("deleteLike..."+ vo);
		return mapper.deleteLike(vo);
	}

	@Override
	public int get(HeartVO vo) {
		log.info("getHeart..." + vo);
		return mapper.get(vo);
	}
/*
 * @Override public int likeUp(HeartVO vo) { log.info("likeUP!!"); return
 * mapper.likeUp(vo); }
 * 
 * @Override public int likeDown(HeartVO vo) { log.info("likeDOWN!!"); return
 * mapper.likeDown(vo); } 
 */
}
