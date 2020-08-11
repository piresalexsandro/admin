package br.com.bigdataservices.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.bigdataservices.entidade.Servico;
import br.com.bigdataservices.service.ServicoService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/servico")
public class ServicoController {
	
	private ServicoService servicoService;

	@Autowired
	public ServicoController(final ServicoService servicoService) {
		this.servicoService = servicoService;
	}
	
	@GetMapping("/form")
	public String servicoForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("servicoForm", new Servico());
		return "servico/form";
	}
	
	@GetMapping("/edit/{id}")
	public String servicoOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("servicoForm", servicoService.findOne(id));
		return "servico/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String servicoDelete(@PathVariable final Long id) {
		return servicoService.deleteServico(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String servicoAdd(@Valid @RequestBody Servico servico, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return servicoService.addServico(servico);
		}
	}
	
	@GetMapping("/list/{id}")
	public Servico findOne(@PathVariable final Long id) {
		return servicoService.findOne(id);
	}
	
	@GetMapping("/list")
	public String servicoList(final Model model) {
		model.addAttribute("servicoes", servicoService.servicoList());
		return "/servico/list";
	}
	
}
