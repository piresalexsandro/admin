package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Observacao;

public interface ObservacaoRepository extends JpaRepository<Observacao, Long> {

}
