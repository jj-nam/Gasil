package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReplycVO;

public interface ReplycService {
	public List<ReplycVO> getList(long rno);
	public ReplycVO get(long dno);
	public int register(ReplycVO dvo);
}
