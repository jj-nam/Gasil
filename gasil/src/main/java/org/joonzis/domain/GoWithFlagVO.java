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
	private long wno;
	private String user_id, wtitle, content, style, city, country, continent;
	private Date departure, arrive, reg_date;
	private int r_cnt, p_cnt;
	
	// join을 한 후 GoWithVO에 담으려고 하니 조인 된 결과는 담기지 않아서 새로 만듦
}
