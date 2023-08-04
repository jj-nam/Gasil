package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;
import org.joonzis.mapper.GoWithMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GoWithServiceImpl implements GoWithService{
	
	@Autowired
	private GoWithMapper mapper;
	
	@Override
	public List<GoWithVO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int getTotal() {
		log.info("total...");
		return mapper.getTotalcount();
	}
}