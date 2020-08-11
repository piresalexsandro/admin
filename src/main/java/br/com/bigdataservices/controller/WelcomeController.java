package br.com.bigdataservices.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.repository.ClienteRepository;
import br.com.bigdataservices.repository.GrupoRepository;
import br.com.bigdataservices.repository.ParametroRepository;
import br.com.bigdataservices.repository.RoleRepository;
import br.com.bigdataservices.repository.ServicoRepository;
import br.com.bigdataservices.repository.SolicitacaoRepository;
import br.com.bigdataservices.repository.UserRepository;
import br.com.bigdataservices.repository.StatusRepository;

@Controller
public class WelcomeController {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private GrupoRepository grupoRepository;
    
    @Autowired
    private ServicoRepository servicoRepository;
    
    @Autowired
    private ClienteRepository clienteRepository;
    
    @Autowired
    private ParametroRepository parametroRepository;
    
    @Autowired
    private SolicitacaoRepository solicitacaoRepository;
    
    @Autowired
    private StatusRepository statusRepository;

	@RequestMapping("/")
	public String welcome(final Model model) {
	    final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    final String name = auth.getName(); //pegar usuario logado
	    if (name != null) {
	        final User user = userRepository.findByUsername(name);
	        if(user != null) {
	            model.addAttribute("userId", user.getId()); 
	        }
	        getQtdCadastros(model);
	    }
		return "welcome";
	}
	
	@RequestMapping("/dashboard")
    public String dashboard(final Model model) {
	    getQtdCadastros(model);
        return "dashboard";
    }
	
	@RequestMapping("/abertura")
    public String abrirSolicitacao(final Model model) {
	    getQtdCadastros(model);
	    model.addAttribute("catalogos", servicoRepository.findAll());
        return "abrirSolicitacao";
    }

	private void getQtdCadastros(final Model model) {
	    
	    final Long countUsuarios = userRepository.count();
	    model.addAttribute("usuarios", countUsuarios);
	    
	    final Long countServicos = servicoRepository.count();
	    model.addAttribute("servicos", countServicos); 
	    
	    final Long countClientes = clienteRepository.count();
        model.addAttribute("clientes", countClientes);
        
        final Long countGrupos = grupoRepository.count();
        model.addAttribute("grupos", countGrupos);
        
        final Long countSolicitacoes = solicitacaoRepository.count();
        model.addAttribute("solicitacoes", countSolicitacoes);
        
        final Long countRoles = roleRepository.count();
        model.addAttribute("roles", countRoles);
        
        final Long countParametros = parametroRepository.count();
        model.addAttribute("parametros", countParametros);
        
        final Long countStatus = statusRepository.count();
        model.addAttribute("status", countStatus);
        
        final String nomeMesAtual = getMesAtual();
        model.addAttribute("nomeMesAtual", nomeMesAtual);
        
        final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    final String name = auth.getName(); //pegar usuario logado
	    if (name != null) {
	        final User user = userRepository.findByUsername(name);
	        model.addAttribute("nomeUsuarioLogado", user.getFullName());
	    }
	}

    private String getMesAtual() {
        final Date data = new Date();
        final Calendar c = Calendar.getInstance();
        c.setTime(data);
        
        // formata e exibe o numero do mes atual
        final Format format = new SimpleDateFormat("MM");
        final String mesAtual = format.format(c.getTime());
        String nomeMes = null;
        
        //Tratamento para exibir mesCorrente
        switch (mesAtual) {
            case "01":
                nomeMes = "Janeiro";
                break;
            case "02":
                nomeMes = "Fevereiro";
                break;
            case "03":
                nomeMes = "Março";
                break;
            case "04":
                nomeMes = "Abril";
                break;
            case "05":
                nomeMes = "Maio";
                break;
            case "06":
                nomeMes = "Junho";
                break;
            case "07":
                nomeMes = "Julho";
                break;
            case "08":
                nomeMes = "Agosto";
                break;
            case "09":
                nomeMes = "Setembro";
                break;
            case "10":
                nomeMes = "Outubro";
                break;
            case "11":
                nomeMes = "Novembro";
                break;
            case "12":
                nomeMes = "Dezembro";
                break;
            default:
                nomeMes = "Mês inexistente";
        }
        return nomeMes;
    }
	
	
}
