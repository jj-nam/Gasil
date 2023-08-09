package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;

public interface GoWithMapper {
	public List<GoWithVO> getListWithPaging(Criteria cri);
	public int getTotalcount();
	public GoWithVO insert(GoWithVO vo);
	public List<CountryVO> getCountry(String continent);
}
