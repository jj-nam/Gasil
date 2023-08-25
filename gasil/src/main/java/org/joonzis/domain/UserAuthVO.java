package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAuthVO {
	private String user_id, user_pw, user_email, user_name, user_birth, user_phone, gender, user_nick, user_pic, auth, grade;
	private long bno;
	private Date joindate;
}
