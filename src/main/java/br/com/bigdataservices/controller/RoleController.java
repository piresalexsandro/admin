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

import br.com.bigdataservices.entidade.Role;
import br.com.bigdataservices.service.RoleService;
import br.com.bigdataservices.utils.ErrorUtils;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	private RoleService roleService;

	@Autowired
	public RoleController(final RoleService roleService) {
		this.roleService = roleService;
	}
	
	@GetMapping("/form")
	public String roleForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("roleForm", new Role());
		return "role/form";
	}
	
	@GetMapping("/edit/{id}")
	public String roleOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("roleForm", roleService.findOne(id));
		return "role/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String roleDelete(@PathVariable final Long id) {
		return roleService.deleteRole(id);
	}
	
	@PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String roleAdd(@Valid @RequestBody final Role role, final BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return roleService.addRole(role);
		}
	}
	
	@GetMapping("/list/{id}")
	public Role findOne(@PathVariable final Long id) {
		return roleService.findOne(id);
	}
	
	@GetMapping("/list")
	public String roleList(final Model model) {
		model.addAttribute("rolees", roleService.roleList());
		return "/role/list";
	}
	
}
