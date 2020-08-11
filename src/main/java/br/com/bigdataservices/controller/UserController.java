package br.com.bigdataservices.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
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
import br.com.bigdataservices.entidade.Role;
import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.service.UserService;
import br.com.bigdataservices.utils.ErrorUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api("Endpoint para acesso aos usuários da aplicação")
@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;

	@Autowired
	//better go with constructor injection
	public UserController(final UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping("/login")
	public String login(final Model model, final String error, final String logout) {
		
		String page = null;
		
		if (error != null) {
			model.addAttribute("error", "Credenciais inválidas.");
			page = "login";
		} else if (logout != null) {
			page = "login";
		} else {
			page = "index";
		}
			
		return page;
	}
	
	@GetMapping("/form")
	public String userForm(final Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("userForm", new User());
		model.addAttribute("roles", userService.roleList());
		model.addAttribute("grupos", userService.grupoUsuarioList());
		return "user/form";
	}
	
	@GetMapping("/edit/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userOne(@PathVariable final Long id, final Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("userForm", userService.findOne(id));
		model.addAttribute("roles", userService.roleList());
		model.addAttribute("grupos", userService.grupoUsuarioList());
		return "user/form";
	}
	
	@GetMapping("/alterarUsuario/{id}")
	@ApiOperation("Criar ou alterar usuário da aplicação")
    public String getUserOneUpdate(@PathVariable final Long id, final Model model) {
	    
	    User userUpdate = userService.findOne(id);
        
	    final List<Role> roleListEncontrada = new ArrayList<Role>();
	    final List<Role> roleList = userService.roleList();
        
        if(!roleList.isEmpty()) {
            for (Role role : roleList) {
                if(userUpdate.getRole().getId().equals(role.getId())) {
                    final Role roleU = new Role();
                    roleU.setId(role.getId());
                    roleU.setName(role.getName());
                    roleListEncontrada.add(roleU);
                    break;
                }
            }
        }
       
        final List<GrupoUsuario> grupoListEncontrada = new ArrayList<GrupoUsuario>();
        final List<GrupoUsuario> grupoList = userService.grupoUsuarioList();
        
        
        if(!grupoList.isEmpty()) {
            for (GrupoUsuario grupo : grupoList) {
                if(userUpdate.getGrupo().getId().equals(grupo.getId())) {
                    final GrupoUsuario grupoU = new GrupoUsuario();
                    grupoU.setId(grupo.getId());
                    grupoU.setName(grupo.getName());
                    grupoListEncontrada.add(grupoU);
                    break;
                }
            }
        }
        
        model.addAttribute("roles", roleListEncontrada);
        model.addAttribute("grupos", grupoListEncontrada);
        model.addAttribute("userForm", userUpdate);
        
        return "user/form";
    }
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation("Excluir usuário da aplicação")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userDelete(@PathVariable final Long id) {
		return userService.deleteUser(id);
	}
	
	@PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userAdd(@Valid @RequestBody final User user, final BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return userService.addUser(user);
		}
	}
	
	@GetMapping("/list/{id}")
	public User findOne(@PathVariable final Long id) {
		return userService.findOne(id);
	}
	
	@GetMapping("/list")
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userList(final Model model) {
		model.addAttribute("users", userService.userList());
		return "/user/list";
	}
	
	@GetMapping("/update/{username}")
    public String userName(@PathVariable final String username, final Model model) {
        model.addAttribute("isNew", false);
        model.addAttribute("userForm", userService.findUserName(username));
        model.addAttribute("roles", userService.roleList());
        return "user/form";
    }
}
