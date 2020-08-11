package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Servico;
import br.com.bigdataservices.repository.ServicoRepository;
import br.com.bigdataservices.service.ServicoService;

@Service
public class ServicoServiceImpl implements ServicoService {
	
	private ServicoRepository servicoRepository;

	@Autowired
	public ServicoServiceImpl(final ServicoRepository servicoRepository) {
		this.servicoRepository = servicoRepository;
	}

	@Override
	public List<Servico> servicoList() {
		return servicoRepository.findAll();
	}

	@Override
	public Servico findOne(final Long id) {
		return servicoRepository.findOne(id);
	}

	@Override
	public String addServico(final Servico servico) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (servico.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			servico.setServico(servico.getServico().toUpperCase().trim().toString());
			servicoRepository.save(servico);
			jsonObject.put("status", "success");
			jsonObject.put("title", " Mensagem de Confirmação");
			jsonObject.put("message", "Servico "+servico.getServico().toUpperCase() +" "+ message + " com sucesso!");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteServico(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			servicoRepository.delete(id);
			jsonObject.put("message", "Registro excluído com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
