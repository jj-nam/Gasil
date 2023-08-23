package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ApplyVO;
import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.GoWithVO;
import org.joonzis.domain.GoWithFlagApplyVO;
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
	public List<GoWithFlagApplyVO> getProposalList(String writer) {
		log.info("getproposalList...");
		return mapper.getProposalList(writer);
	}
	
	@Override
	public List<GoWithFlagVO> getGoWithList(String writer) {
		return mapper.getGoWithList(writer);
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
	public int remove(long wno) {
		return mapper.remove(wno);
	}
	@Override
	public List<ApplyVO> getApply(long wno) {
		log.info("apply list : " + wno);
		return mapper.getApply(wno);
	}
	@Override
	public int checkApply(ApplyVO vo) {
		log.info("check apply : " + vo);
		return mapper.checkApply(vo);
	}
	@Override
	public int insertApply(ApplyVO vo) {
		log.info("insert apply : " + vo);
		return mapper.insertApply(vo);
	}
	@Override
	public int deleteApply(ApplyVO vo) {
		log.info("delete apply : " + vo);
		return mapper.deleteApply(vo);
	}
	@Override
	public int findano(ApplyVO vo) {
		return mapper.findano(vo);
	}
	@Override
	public int checkConfirm(ApplyVO vo) {
		return mapper.checkConfirm(vo);
	}
	@Override
	public int getConfirm(ApplyVO vo) {
		log.info("confirm");
		return mapper.getConfirm(vo);
	}
	@Override
	public int deleteConfirm(ApplyVO vo) {
		log.info("cancel");
		return mapper.deleteConfirm(vo);
	}
	@Override
	public int getP_cnt(long wno) {
		return mapper.getP_cnt(wno);
	}
	@Override
	public int getOver(long wno) {
		return mapper.getOver(wno);
	}
}
