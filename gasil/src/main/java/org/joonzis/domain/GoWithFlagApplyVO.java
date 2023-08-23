package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoWithFlagApplyVO {
	private String flag;
	private long wno, ano;
	private String user_id, user_nick, wtitle, gender, city, departure, arrive;
	private Date reg_date;
	private int age, confirmation;
}
