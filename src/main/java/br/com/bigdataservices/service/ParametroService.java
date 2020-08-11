package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Parametro;

public interface ParametroService {
	
	List<Parametro> parametroList();
	
	Parametro findOne(Long id);
	
	String addParametro(Parametro parametro);
	
	String deleteParametro(Long id);
}
