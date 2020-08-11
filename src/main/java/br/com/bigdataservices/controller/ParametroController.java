package br.com.bigdataservices.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.bigdataservices.entidade.Parametro;
import br.com.bigdataservices.service.ParametroService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/parametro")
public class ParametroController {
	
	private ParametroService parametroService;

	@Autowired
	public ParametroController(final ParametroService parametroService) {
		this.parametroService = parametroService;
	}
	
	@GetMapping("/form")
	public String parametroForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("parametroForm", new Parametro());
		return "parametro/form";
	}
	
	@GetMapping("/edit/{id}")
	public String parametroOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("parametroForm", parametroService.findOne(id));
		return "parametro/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	//@PreAuthorize("hasParametro('ROLE_ADMIN')")
	public @ResponseBody String parametroDelete(@PathVariable final Long id) {
		return parametroService.deleteParametro(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String parametroAdd(@Valid @RequestBody final Parametro parametro, final BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return parametroService.addParametro(parametro);
		}
	}
	
	@GetMapping("/list/{id}")
	public Parametro findOne(@PathVariable final Long id) {
		return parametroService.findOne(id);
	}
	
	@GetMapping("/list")
	public String parametroList(final Model model) {
		model.addAttribute("parametroes", parametroService.parametroList());
		return "/parametro/list";
	}
	
}
