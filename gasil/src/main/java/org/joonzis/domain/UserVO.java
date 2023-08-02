package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String user_id, user_pw, user_email, user_name, user_birth,user_phone, gender, grade, user_nick;
	private Date joindate;
}
