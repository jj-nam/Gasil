package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ApplyVO;
import org.joonzis.domain.CountryVO;
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
	public List<ApplyVO> getApply(long wno);
	public int checkApply(ApplyVO vo);
	public int insertApply(ApplyVO vo);
	public int deleteApply(ApplyVO vo);
	public int findano(ApplyVO vo);
	public int checkConfirm(long ano);
	public int getConfirm(ApplyVO vo);
	public int deleteConfirm(ApplyVO vo);
}
