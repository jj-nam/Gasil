package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReplycVO;
import org.joonzis.mapper.ReplyMapper;
import org.joonzis.mapper.ReplycMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplycServiceImpl implements ReplycService{

	@Autowired
	private ReplycMapper dmapper;
	
	@Autowired
	private ReplyMapper rmapper;
	
	@Override
	public List<ReplycVO> getList(long rno) {
		return dmapper.getList(rno);
	}
	@Override
	public ReplycVO get(long dno) {
		log.info("getGet..." + dno);
		return dmapper.read(dno);
	}
	
	@Override
	public int register(ReplycVO dvo) {
		log.info("reReplyRegister..." + dvo);
		return dmapper.insert(dvo);
	}
}
