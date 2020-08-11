package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Servico;
import br.com.bigdataservices.entidade.Solicitacao;

public interface SolicitacaoService {
	
	List<Solicitacao> solicitacaoList();
	
	Solicitacao findOne(Long id);
	
	String addSolicitacao(Solicitacao solicitacao);
	
	String deleteSolicitacao(Long id);

	List<Servico> servicoList();
}
