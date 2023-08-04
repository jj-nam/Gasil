package org.joonzis.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
		
			log.warn("Login Success");
			
			List<String> roleNames = new ArrayList<String>();
			
			// 권한 가져오기
			for(GrantedAuthority auth : authentication.getAuthorities()) {
				roleNames.add(auth.getAuthority());
			}
			
			log.warn("ROLE NAME : " + roleNames);
			
			/*
			 * if(roleNames.contains("ROLE_ADMIN")) {
			 * response.sendRedirect("/sample/admin"); return; }
			 */
			
			if(roleNames.contains("user")) {
				response.sendRedirect("/sample/member");
				return;
			}
			response.sendRedirect("/");
		}
}