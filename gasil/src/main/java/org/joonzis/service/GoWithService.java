package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;

public interface GoWithService {
	public List<GoWithVO> getList(Criteria cri);
	public int getTotal();
	public GoWithVO insert(GoWithVO vo);
	public List<CountryVO> getCountry(String continent);
}	
