package org.joonzis.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String user_id, user_pw, user_email, user_name, user_birth,user_phone, gender, user_nick, user_pic;
	private Date joindate;
	
	private List<AuthVO> authList;
}
