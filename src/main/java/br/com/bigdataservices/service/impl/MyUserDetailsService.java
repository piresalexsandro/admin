package br.com.bigdataservices.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		final User user = userRepository.findByUsername(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("Email "+username+" nao encontrado");
		}
		
		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), getGrantedAuthorities(user));
	}

	private Collection<GrantedAuthority> getGrantedAuthorities(final User user) {
		return getGrantedAuthoritiesByRoleUser(user);
	}

	private Collection<GrantedAuthority> getGrantedAuthoritiesByRoleUser(final User user) {
		
		final Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		
		if(user.getRole().getName().equals("ROLE_ADMIN")) {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else if(user.getRole().getName().equals("ROLE_EXECUTOR")) {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_EXECUTOR"));
		} else if(user.getRole().getName().equals("ROLE_GESTOR_C2C")) {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_GESTOR_C2C"));
		} else if(user.getRole().getName().equals("ROLE_EXTERNO")) {
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_EXTERNO"));
        } else if(user.getRole().getName().equals("ROLE_COMERCIAL")) {
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_COMERCIAL"));
        } else if(user.getRole().getName().equals("ROLE_GESTOR_COMERCIAL")) {
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_GESTOR_COMERCIAL"));
        } else if(user.getRole().getName().equals("ROLE_JURIDICO")) {
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_JURIDICO"));
        } else {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_SOLICITANTE"));
		}
		
		return grantedAuthorities;
	}
}
