package br.com.bigdataservices.service;

import java.util.List;

import br.com.bigdataservices.entidade.Status;

public interface StatusService {
	
	List<Status> statusList();
	
	Status findOne(Long id);
	
	String addStatus(Status status);
	
	String deleteStatus(Long id);
}
