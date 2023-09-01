
package org.joonzis.service;

import org.joonzis.domain.UserAuthVO;
import org.joonzis.domain.UserVO;

public interface UserService {
	public UserAuthVO getPersonInfo(String writer);
	public void join(UserVO uvo);
	public UserAuthVO login(UserAuthVO vo);
	public void addAuth(String user_id);
	public String getBirth(String user_id);
	public boolean modify(UserAuthVO vo);
	public void updateImage(UserVO vo);
	public String getNick(String user_id);
	public String getId(String recv_nick);
}
