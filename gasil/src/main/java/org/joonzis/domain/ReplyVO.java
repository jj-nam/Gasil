package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
	private long no, bno, rgp, deep, rno;
	private String writer, content;
	private Date reply_date;
}
