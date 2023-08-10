package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.CountryVO;
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
	
	@Override
	public int insert(GoWithVO vo) {
		log.info("insert...");
		return mapper.insert(vo);
	}
	
	@Override
	public List<CountryVO> getCountry(String continent) {
		log.info("getContry");
		return mapper.getCountry(continent);
	}
	
	@Override
	public List<CountryVO> getCity(String country) {
		return mapper.getCity(country);
	}
	
	@Override
	public void getPeriod(GoWithVO gvo) {
		log.info("period...");
		mapper.getPeriod(gvo);
	}
}
