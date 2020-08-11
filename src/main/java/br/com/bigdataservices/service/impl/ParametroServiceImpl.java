package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Parametro;
import br.com.bigdataservices.repository.ParametroRepository;
import br.com.bigdataservices.service.ParametroService;

@Service
public class ParametroServiceImpl implements ParametroService {
	
	private ParametroRepository parametroRepository;

	@Autowired
	public ParametroServiceImpl(final ParametroRepository parametroRepository) {
		this.parametroRepository = parametroRepository;
	}

	@Override
	public List<Parametro> parametroList() {
		return parametroRepository.findAll();
	}

	@Override
	public Parametro findOne(final Long id) {
		return parametroRepository.findOne(id);
	}

	@Override
	public String addParametro(final Parametro parametro) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (parametro.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			parametroRepository.save(parametro);
			jsonObject.put("status", "success");
			jsonObject.put("title"," Mensagem de confirmação");
			jsonObject.put("message", "Parametro "+parametro.getStatusInicial().getNome() +" "+ message + " com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteParametro(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			parametroRepository.delete(id);
			jsonObject.put("message", "Parametro excluido com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
