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

import br.com.bigdataservices.entidade.GrupoUsuario;
import br.com.bigdataservices.service.GrupoService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/grupo")
public class GrupoController {
	
	private GrupoService grupoService;

	@Autowired
	public GrupoController(final GrupoService grupoService) {
		this.grupoService = grupoService;
	}
	
	@GetMapping("/form")
	public String grupoForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("grupoForm", new GrupoUsuario());
		return "grupo/form";
	}
	
	@GetMapping("/edit/{id}")
	public String grupoOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("grupoForm", grupoService.findOne(id));
		return "grupo/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String grupoDelete(@PathVariable final Long id) {
		return grupoService.deleteGrupo(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String grupoAdd(@Valid @RequestBody final GrupoUsuario grupo, final BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return grupoService.addGrupo(grupo);
		}
	}
	
	@GetMapping("/list/{id}")
	public GrupoUsuario findOne(@PathVariable final Long id) {
		return grupoService.findOne(id);
	}
	
	@GetMapping("/list")
	public String grupoList(final Model model) {
		model.addAttribute("grupoes", grupoService.grupoList());
		return "/grupo/list";
	}
	
}
