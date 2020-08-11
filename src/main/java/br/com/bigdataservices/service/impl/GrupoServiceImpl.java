package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.GrupoUsuario;
import br.com.bigdataservices.repository.GrupoRepository;
import br.com.bigdataservices.service.GrupoService;

@Service
public class GrupoServiceImpl implements GrupoService {
	
	private GrupoRepository grupoRepository;

	@Autowired
	public GrupoServiceImpl(final GrupoRepository grupoRepository) {
		this.grupoRepository = grupoRepository;
	}

	@Override
	public List<GrupoUsuario> grupoList() {
		return grupoRepository.findAll();
	}

	@Override
	public GrupoUsuario findOne(final Long id) {
		return grupoRepository.findOne(id);
	}

	@Override
	public String addGrupo(final GrupoUsuario grupo) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (grupo.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			grupo.setName(grupo.getName().toUpperCase().trim().toString());
			grupoRepository.save(grupo);
			jsonObject.put("status", "success");
			jsonObject.put("title"," Mensagem de confirmação");
			jsonObject.put("message", "Grupo "+grupo.getName() +" "+ message + " com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteGrupo(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			grupoRepository.delete(id);
			jsonObject.put("message", "Grupo excluido com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
