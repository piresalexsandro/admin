package br.com.bigdataservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.bigdataservices.entidade.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

}
