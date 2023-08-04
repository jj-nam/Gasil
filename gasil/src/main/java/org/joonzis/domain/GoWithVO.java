package org.joonzis.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoWithVO {
	private long wno;
	private String user_id, wtitle, content, style, city, country, continent;
	private Date departure, arrive, reg_date;
	private int r_cnt, p_cnt;
	
	/* private List<CountryVO> countryList; */
}
