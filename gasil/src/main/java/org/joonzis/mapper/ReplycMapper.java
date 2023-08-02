package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReplycVO;

public interface ReplycMapper {
	public List<ReplycVO> getList(long rno);
	public ReplycVO read(long dno);
	public int insert(ReplycVO dvo);
}
