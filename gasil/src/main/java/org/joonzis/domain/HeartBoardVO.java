package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HeartBoardVO {
	private long bno, hno;
	private int bview, r_cnt;
	private String user_nick, writer, title;
	private Date reg_date;
}
