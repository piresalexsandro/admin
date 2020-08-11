package br.com.bigdataservices.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Cliente;
import br.com.bigdataservices.repository.ClienteRepository;
import br.com.bigdataservices.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService {
	
	private ClienteRepository clienteRepository;

	@Autowired
	public ClienteServiceImpl(final ClienteRepository clienteRepository) {
		this.clienteRepository = clienteRepository;
	}

	@Override
	public List<Cliente> clienteList() {
		return clienteRepository.findAll(orderByIdAsc());
	}
	
	private Sort orderByIdAsc() {
	    return new Sort(Sort.Direction.ASC, "id").and(new Sort(Sort.Direction.ASC, "nome"));
	}

	@Override
	public Cliente findOne(final Long id) {
		return clienteRepository.findOne(id);
	}

	@Override
	public String addCliente(final Cliente cliente) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (cliente.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			cliente.setNome(cliente.getNome().toUpperCase().trim().toString());
			clienteRepository.save(cliente);
			jsonObject.put("status", "success");
			jsonObject.put("title", " Mensagem de Confirmação");
			jsonObject.put("message", "Cliente "+cliente.getNome().toUpperCase() +" "+ message + " com sucesso!");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteCliente(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			clienteRepository.delete(id);
			jsonObject.put("message", "Registro excluído com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	//@Override
	/*
	 * public List<String> search(final String keyword) { final List<String>
	 * listaClientes = clienteRepository.search(keyword); return
	 * listaClientes.stream().filter(s ->
	 * s.toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toList())
	 * ; }
	 */

	@Override
	public List<Cliente> getListaClientePorNome(final String keyword) {
		  final List<Cliente> listaClientes = clienteRepository.listTodosClientesPorNome(keyword);
		  return listaClientes;
	}
}
