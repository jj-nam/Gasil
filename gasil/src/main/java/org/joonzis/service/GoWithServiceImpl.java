package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithFlagVO;
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
	public List<GoWithFlagVO> getList() {
		log.info("getList...");
		return mapper.getList();
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
	public GoWithFlagVO get(long wno) {
		return mapper.get(wno);
	}
	@Override
	public boolean remove(long wno) {
		return mapper.remove(wno);
	}
	@Override
	public boolean modify(GoWithFlagVO vo) {
		return mapper.modify(vo);
	}
}
