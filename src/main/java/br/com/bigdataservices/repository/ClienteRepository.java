package br.com.bigdataservices.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.bigdataservices.entidade.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {
	
	@Query("FROM Cliente WHERE codCliente=:codCliente")
	Cliente findByCodCliente(@Param("codCliente") final String codCliente);
    
	/*
	 * Lista clientes por nome 
	 */
	@Query(value = "SELECT id, cod_sap, nome, status  "
		    + "	FROM cliente  "
		    + "	WHERE nome like %?1% "
			+ "	ORDER BY nome ", nativeQuery = true)
	List<Cliente> listTodosClientesPorNome(String keyword);
}
