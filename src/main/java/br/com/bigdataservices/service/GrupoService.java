package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.GrupoUsuario;

public interface GrupoService {
	
	List<GrupoUsuario> grupoList();
	
	GrupoUsuario findOne(Long id);
	
	String addGrupo(GrupoUsuario grupo);
	
	String deleteGrupo(Long id);
}
