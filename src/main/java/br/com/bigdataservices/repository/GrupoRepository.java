package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.GrupoUsuario;

public interface GrupoRepository extends JpaRepository<GrupoUsuario, Long> {

}
