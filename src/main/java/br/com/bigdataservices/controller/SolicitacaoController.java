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

import br.com.bigdataservices.entidade.Solicitacao;
import br.com.bigdataservices.service.ServicoService;
import br.com.bigdataservices.service.SolicitacaoService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/solicitacao")
public class SolicitacaoController {
    
    @Autowired
    private ServicoService servicoService;
	
	private SolicitacaoService solicitacaoService;

	@Autowired
	public SolicitacaoController(final SolicitacaoService solicitacaoService) {
		this.solicitacaoService = solicitacaoService;
	}
	
	@GetMapping("/form")
	public String solicitacaoForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("catalogos", servicoService.servicoList());
		model.addAttribute("solicitacaoForm", new Solicitacao());
		return "solicitacao/form";
	}
	
	@GetMapping("/edit/{id}")
	public String solicitacaoOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("solicitacaoForm", solicitacaoService.findOne(id));
		return "solicitacao/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String solicitacaoDelete(@PathVariable final Long id) {
		return solicitacaoService.deleteSolicitacao(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String solicitacaoAdd(@Valid @RequestBody Solicitacao solicitacao, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return solicitacaoService.addSolicitacao(solicitacao);
		}
	}
	
	@GetMapping("/list/{id}")
	public Solicitacao findOne(@PathVariable final Long id) {
		return solicitacaoService.findOne(id);
	}
	
	@GetMapping("/list")
	public String solicitacaoList(final Model model) {
		model.addAttribute("solicitacaoes", solicitacaoService.solicitacaoList());
		return "/admin/list";
	}
	
}
