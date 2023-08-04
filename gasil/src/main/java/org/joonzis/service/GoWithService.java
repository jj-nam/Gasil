package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;

public interface GoWithService {
	public List<GoWithVO> getList(Criteria cri);
	public int getTotal();
}	
