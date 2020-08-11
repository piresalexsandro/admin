package br.com.bigdataservices.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.bigdataservices.entidade.Cliente;
import br.com.bigdataservices.service.ClienteService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	private ClienteService clienteService;

	@Autowired
	public ClienteController(final ClienteService clienteService) {
		this.clienteService = clienteService;
	}
	
	@GetMapping("/form")
	public String clienteForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("clienteForm", new Cliente());
		return "cliente/form";
	}
	
	@GetMapping("/edit/{id}")
	public String clienteOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("clienteForm", clienteService.findOne(id));
		return "cliente/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String clienteDelete(@PathVariable final Long id) {
		return clienteService.deleteCliente(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String clienteAdd(@Valid @RequestBody final Cliente cliente, final BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return clienteService.addCliente(cliente);
		}
	}
	
	@GetMapping("/list/{id}")
	public Cliente findOne(@PathVariable final Long id) {
		return clienteService.findOne(id);
	}
	
	@GetMapping("/list")
	public String clienteList(final Model model) {
		model.addAttribute("clientees", clienteService.clienteList());
		return "/cliente/list";
	}
	
	@GetMapping("/pesquisaCliente")
	public ResponseEntity<String> pesquisaCliente(@RequestParam("term") final String keyword) {
		List<Cliente> listaClientes = clienteService.getListaClientePorNome(keyword);
		List<String> listaResultadosPesquisaClientes = new ArrayList<String>();
		
		  for (Cliente cliente : listaClientes) {
			   String resultado = cliente.getCodCliente().concat("-").concat(cliente.getNome());
			   listaResultadosPesquisaClientes.add(resultado);
		  }
		
		ObjectMapper mapper = new ObjectMapper();
		String resp = "";

		try {
			resp = mapper.writeValueAsString(listaResultadosPesquisaClientes);
			
		} catch (JsonProcessingException e) {
		}

		return new ResponseEntity<String>(resp, HttpStatus.OK);
	}
	
}
