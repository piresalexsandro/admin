package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Role;
import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.entidade.GrupoUsuario;

public interface UserService {
	List<User> userList();
	
	User findOne(Long id);
	
	String addUser(User user);
	
	String deleteUser(Long id);
	
	List<Role> roleList();
	
	List<GrupoUsuario> grupoUsuarioList();
	
	User findUserName(String username);
}
