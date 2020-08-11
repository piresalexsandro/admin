package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Servico;

public interface ServicoRepository extends JpaRepository<Servico, Long> {

}
