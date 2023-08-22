package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.HeartVO;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.mapper.HeartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<BoardVO> getMyList(String writer) {
		log.info("getMyList...");
		return mapper.getMyList(writer);
	}
	
	@Override
	public void register(BoardVO vo) {
		log.info("getResister...");
		mapper.insert(vo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(long bno) {
		log.info("getGet...");
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public boolean remove(long bno) {
		log.info("getRemove...");
		return mapper.delete(bno);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO vo) {
		log.info("getModify...");
		boolean modifyResult = mapper.update(vo);
		
		return modifyResult;
	}
	
	@Override
	public int getTotal() {
		log.info("total...");
		return mapper.getTotalcount();
	}
	
	@Override
	public BoardVO movePage(long bno){
		return mapper.movePage(bno);
	}
	
	@Override
	public int upHeart(long bno) {
		log.info("upHeart...");
		return mapper.upHeart(bno);
	}
	
	@Override
	public int downHeart(long bno) {
		log.info("downHeart");
		return mapper.downHeart(bno);
	}
	

}