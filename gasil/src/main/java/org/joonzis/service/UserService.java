
package org.joonzis.service;

import org.joonzis.domain.UserVO;

public interface UserService {
	public void certifiedPhoneNumber(String userPhoneNumber, String randomNumber);
	public void join(UserVO uvo);
	public UserVO login(UserVO vo);
	public void addAuth(String user_id);
}
