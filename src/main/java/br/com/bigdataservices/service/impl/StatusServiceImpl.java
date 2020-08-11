package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Status;
import br.com.bigdataservices.repository.StatusRepository;
import br.com.bigdataservices.service.StatusService;

@Service
public class StatusServiceImpl implements StatusService {
	
	private StatusRepository statusRepository;

	@Autowired
	public StatusServiceImpl(final StatusRepository statusRepository) {
		this.statusRepository = statusRepository;
	}

	@Override
	public List<Status> statusList() {
		return statusRepository.findAll();
	}

	@Override
	public Status findOne(final Long id) {
		return statusRepository.findOne(id);
	}

	@Override
	public String addStatus(final Status status) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (status.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			status.setNome(status.getNome().toUpperCase().trim().toString());
			statusRepository.save(status);
			jsonObject.put("status", "success");
			jsonObject.put("title", " Mensagem de Confirmação");
			jsonObject.put("message", "Status "+status.getNome().toUpperCase() +" "+ message + " com sucesso!");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteStatus(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			statusRepository.delete(id);
			jsonObject.put("message", "Registro excluído com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
