package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardReplyVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.ReplyVO;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service	//service 코드는 무조건 추가 
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper rmapper;
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<ReplyVO> getList(long bno) {
		return rmapper.getList(bno);
	}
	@Override
	public ReplyVO get(long rno) {
		log.info("getGet..." + rno);
		return rmapper.read(rno);
	}
	
	@Override
	public List<BoardReplyVO> getMyReplyList(String writer) {
		log.info("getMyReplyList...");
		return rmapper.getMyReplyList(writer);
	}
	
	@Transactional
	@Override
	public int register(ReplyVO rvo) {
		log.info("getRegister..." + rvo);

		mapper.updateReplyCnt(rvo.getBno(), 1);
		return rmapper.insert(rvo);
	}
	
	@Transactional
	@Override
	public int reply_register(ReplyVO rvo) {
		log.info("getRegister..." + rvo);
		
		mapper.updateReplyCnt(rvo.getBno(), 1);
		return rmapper.insert_reply(rvo);
	}
	
	
	@Transactional
	@Override
	public int remove(long no) {
		log.info("getRemove..." + no);
		
		ReplyVO rvo = get(no);
		mapper.updateReplyCnt(rvo.getBno(), -1);
		log.info(no);
		
		return rmapper.delete(no);
		
	}
	
	@Override
	public int modify(ReplyVO rvo) {
		log.info("getModify..." + rvo);
		return rmapper.update(rvo);
	}
	@Override
	public int removeAll(long bno) {
		return rmapper.removeAll(bno);
	}
}