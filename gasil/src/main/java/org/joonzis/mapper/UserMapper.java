package org.joonzis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.joonzis.domain.UserAuthVO;
import org.joonzis.domain.UserVO;

@Mapper
public interface UserMapper {
	public int idCheck(String user_id);
	public UserAuthVO getPersonInfo(String writer);
	public void insert(UserVO uvo);
	public UserAuthVO login(UserAuthVO vo); 
	public void addAuth(String user_id);
	public String getBirth(String user_id);
	public boolean modify(UserAuthVO vo);
}
