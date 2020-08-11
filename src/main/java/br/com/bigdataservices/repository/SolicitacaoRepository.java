package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Solicitacao;

public interface SolicitacaoRepository extends JpaRepository<Solicitacao, Long> {

}
