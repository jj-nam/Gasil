package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplycVO {
	private String user_id, reply_c; 
	private long dno, rno, bno;
	private Date reg_reply_date;
}


