package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Role;

public interface RoleService {
	
	List<Role> roleList();
	
	Role findOne(Long id);
	
	String addRole(Role role);
	
	String deleteRole(Long id);
}
