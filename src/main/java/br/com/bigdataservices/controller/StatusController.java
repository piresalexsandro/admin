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

import br.com.bigdataservices.entidade.Status;
import br.com.bigdataservices.service.StatusService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/status")
public class StatusController {
	
	private StatusService statusService;

	@Autowired
	public StatusController(final StatusService statusService) {
		this.statusService = statusService;
	}
	
	@GetMapping("/form")
	public String statusForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("statusForm", new Status());
		return "status/form";
	}
	
	@GetMapping("/edit/{id}")
	public String statusOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("statusForm", statusService.findOne(id));
		return "status/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String statusDelete(@PathVariable final Long id) {
		return statusService.deleteStatus(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String statusAdd(@Valid @RequestBody Status status, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return statusService.addStatus(status);
		}
	}
	
	@GetMapping("/list/{id}")
	public Status findOne(@PathVariable final Long id) {
		return statusService.findOne(id);
	}
	
	@GetMapping("/list")
	public String statusList(final Model model) {
		model.addAttribute("statuses", statusService.statusList());
		return "/status/list";
	}
	
}
