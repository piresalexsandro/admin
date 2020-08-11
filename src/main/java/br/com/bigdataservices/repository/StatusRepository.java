package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Status;

public interface StatusRepository extends JpaRepository<Status, Long> {

}
