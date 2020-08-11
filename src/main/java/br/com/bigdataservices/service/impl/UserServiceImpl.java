package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Role;
import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.entidade.GrupoUsuario;
import br.com.bigdataservices.repository.RoleRepository;
import br.com.bigdataservices.repository.UserRepository;
import br.com.bigdataservices.repository.GrupoRepository;
import br.com.bigdataservices.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
    private GrupoRepository grupoUsuarioRepository;
	
	@Override
	public List<User> userList() {
		return userRepository.findAll();
	}

	@Override
	public User findOne(final Long id) {
		return userRepository.findOne(id);
	}

	@Override
	public String addUser(final User user) {
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if(user.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			user.setFullName(user.getFullName().toUpperCase().trim().toString());
			user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
			user.setRole(roleRepository.findOne(user.getRoleId()));
			user.setGrupo(grupoUsuarioRepository.findOne(user.getGrupoId()));
			user.setRegistroStatus(1);
			jsonObject.put("status", "success");
			jsonObject.put("title", " Mensagem de confirmação");
			jsonObject.put("message", userRepository.save(user).getFullName()+" "+message+" com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteUser(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			userRepository.delete(id);
			jsonObject.put("message", "Usuário excluido com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	@Override
	public List<Role> roleList() {
		return roleRepository.findAll();
	}
	
	@Override
    public List<GrupoUsuario> grupoUsuarioList() {
        return grupoUsuarioRepository.findAll();
    }
	
	@Override
    public User findUserName(final String username) {
        return userRepository.findByUsername(username);
    }

}
