package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardUserVO {
	private String writer, title, bcontent, cate_id, nexttitle, lasttitle, user_id, user_email, user_name, user_birth, user_phone, gender, user_nick, user_pic;
	private int blike, bview, r_cnt, next, last;
	private Date joindate,reg_date;
	private long bno;
}
