package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Parametro;

public interface ParametroRepository extends JpaRepository<Parametro, Long> {

}
