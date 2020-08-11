package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Role;
import br.com.bigdataservices.repository.RoleRepository;
import br.com.bigdataservices.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	private RoleRepository roleRepository;

	@Autowired
	public RoleServiceImpl(final RoleRepository roleRepository) {
		this.roleRepository = roleRepository;
	}

	@Override
	public List<Role> roleList() {
		return roleRepository.findAll();
	}

	@Override
	public Role findOne(final Long id) {
		return roleRepository.findOne(id);
	}

	@Override
	public String addRole(final Role role) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (role.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			role.setName(role.getName().toUpperCase().trim().toString());
			roleRepository.save(role);
			jsonObject.put("status", "success");
			jsonObject.put("title"," Mensagem de confirmação");
			jsonObject.put("message", "Perfil "+role.getName() +" "+ message + " com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteRole(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			roleRepository.delete(id);
			jsonObject.put("message", "Perfil excluido com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
