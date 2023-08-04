package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;

public interface GoWithMapper {
	public List<GoWithVO> getListWithPaging(Criteria cri);
	public List<GoWithVO> getList();
	public int getTotalcount();	
}
