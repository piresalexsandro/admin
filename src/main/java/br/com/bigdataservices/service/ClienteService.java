package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Cliente;

public interface ClienteService {
	
	List<Cliente> clienteList();
	
	Cliente findOne(Long id);
	
	String addCliente(Cliente cliente);
	
	String deleteCliente(Long id);
	
	//public List<String> search(String keyword);

	public List<Cliente> getListaClientePorNome(String keyword);
}
