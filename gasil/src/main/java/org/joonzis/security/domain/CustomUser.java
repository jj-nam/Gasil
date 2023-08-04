package org.joonzis.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.joonzis.domain.UserVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	
	private UserVO vo;
	
	public CustomUser(String user_id, String user_pw, 
			Collection<? extends GrantedAuthority> authorities) {
		super(user_id, user_pw, authorities);
	}
	
	public CustomUser(UserVO vo) {
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuthList().stream().
				map(auth -> new SimpleGrantedAuthority(auth.getAuth())).
				collect(Collectors.toList()));
		
		this.vo = vo;
	}
}