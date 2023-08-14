package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.GoWithVO;

public interface GoWithMapper {
	public List<GoWithFlagVO> getList();
	public int getTotalcount();
	public int insert(GoWithVO vo);
	public List<CountryVO> getCountry(String continent);
	public List<CountryVO> getCity(String city);
	public GoWithFlagVO get(long wno);
	public boolean remove(long wno);
}
