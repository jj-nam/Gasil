package org.joonzis.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageVO {
	private long mno;
	private String send_nick, recv_nick, content, other_nick, nick, profile, room;
	private Date send_time, read_time;
	private int read_chk, unread;
}
