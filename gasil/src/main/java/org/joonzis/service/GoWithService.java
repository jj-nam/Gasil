package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.GoWithVO;

public interface GoWithService {
	public List<GoWithFlagVO> getList();
	public int getTotal();
	public int insert(GoWithVO vo);
	public List<CountryVO> getCountry(String continent);
	public List<CountryVO> getCity(String country);
	public GoWithFlagVO get(long wno);
	public boolean remove(long wno);
}	
