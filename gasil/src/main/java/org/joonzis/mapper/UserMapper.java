package org.joonzis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.joonzis.domain.UserVO;

@Mapper
public interface UserMapper {
	public int idCheck(String user_id);
	public void insert(UserVO vo);
	public UserVO login(UserVO vo); 
	public void addAuth(String user_id);
}
