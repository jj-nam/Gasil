package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardReplyVO {
	private String title, content;
	private int r_cnt;
	private long bno, rno;
	private Date reply_date;
}
