package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Servico;

public interface ServicoService {
	
	List<Servico> servicoList();
	
	Servico findOne(Long id);
	
	String addServico(Servico servico);
	
	String deleteServico(Long id);
}
