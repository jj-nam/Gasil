package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyUserVO {
	private long no, bno, rgp, deep, rno;
	private String writer, content, user_id, user_email, user_name, user_birth, user_phone, gender, user_nick, user_pic;
	private Date reply_date, joindate;
}
