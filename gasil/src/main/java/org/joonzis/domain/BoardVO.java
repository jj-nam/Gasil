package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private String writer, title, bcontent, cate_id, nexttitle, lasttitle;
	private int blike, bview, r_cnt, next, last;
	private long bno;
	private Date reg_date;
}
