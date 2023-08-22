package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoWithFlagVO {
	private String flag;
	private long wno, period, confirmation, ano;
	private String user_id, user_nick, wtitle, gender, content, style, city, country, continent, departure, arrive;
	private Date reg_date;
	private int p_cnt, people, age;
}
