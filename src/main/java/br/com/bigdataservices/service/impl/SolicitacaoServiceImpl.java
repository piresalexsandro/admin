package br.com.bigdataservices.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.entidade.Cliente;
import br.com.bigdataservices.entidade.GrupoUsuario;
import br.com.bigdataservices.entidade.HistoricoStatus;
import br.com.bigdataservices.entidade.Observacao;
import br.com.bigdataservices.entidade.Servico;
import br.com.bigdataservices.entidade.Solicitacao;
import br.com.bigdataservices.entidade.Status;
import br.com.bigdataservices.entidade.User;
import br.com.bigdataservices.repository.ClienteRepository;
import br.com.bigdataservices.repository.ObservacaoRepository;
import br.com.bigdataservices.repository.ServicoRepository;
import br.com.bigdataservices.repository.SolicitacaoRepository;
import br.com.bigdataservices.repository.UserRepository;
import br.com.bigdataservices.repository.HistoricoStatusRepository;
import br.com.bigdataservices.service.SolicitacaoService;

@Service
public class SolicitacaoServiceImpl implements SolicitacaoService {
	
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private ServicoRepository servicoRepository;
	
	@Autowired
    private ClienteRepository clienteRepository;
	
	@Autowired
    private ObservacaoRepository observacaoRepository;
	
	@Autowired
    private HistoricoStatusRepository historicoStatusRepository;
	
	private SolicitacaoRepository solicitacaoRepository;

	@Autowired
	public SolicitacaoServiceImpl(final SolicitacaoRepository solicitacaoRepository) {
		this.solicitacaoRepository = solicitacaoRepository;
	}

	@Override
	public List<Solicitacao> solicitacaoList() {
		return solicitacaoRepository.findAll();
	}

	@Override
	public Solicitacao findOne(final Long id) {
		return solicitacaoRepository.findOne(id);
	}

	@Override
	public String addSolicitacao(final Solicitacao solicitacao) { 
		String message = null;
		final JSONObject jsonObject = new JSONObject();
		try {
			if (solicitacao.getId() == null) {
				message = "adicionado";
			} else {
				message = "alterado";
			}
			//Setando o status inicial da Solicitacao
			Status statusSolicitacao = new Status();
			statusSolicitacao.setId(5L);
			solicitacao.setStatusSolicitacao(statusSolicitacao);
			
			//Setando o grupo inicial da Solicitacao
			GrupoUsuario grupoResponsavel = new GrupoUsuario();
			grupoResponsavel.setId(3L);
			solicitacao.setGrupoResponsavel(grupoResponsavel);
			
			//Setando o servico selecionado pelo usuario solicitante
			Servico servico = new Servico();
			servico.setId(solicitacao.getServicoId());
			solicitacao.setServico(servico);
			
			//Tratamento para setar o cliente selecionado na pesquisa do solicitante
			Cliente cliente = new Cliente();
			cliente = clienteRepository.findByCodCliente(solicitacao.getClienteId());
			
			if (!Objects.isNull(cliente)) {
			    cliente.setId(cliente.getId());
			} else {
			    cliente.setCodCliente(solicitacao.getClienteId());
			    cliente.setNome(solicitacao.getNomeCliente());
			    cliente.setStatus(1);
			    clienteRepository.save(cliente);
			}
			
			solicitacao.setCliente(cliente);
			
			//Setando o usuario solicitante
			final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    final String name = auth.getName(); //pegar usuario logado
		    if (name != null) {
		        final User user = userRepository.findByUsername(name);
		        solicitacao.setUsuarioResponsavel(user);
		    }
		    
		    //Setando a data atual para criacao da solicitacao
			solicitacao.setDataCriacao(new Date());
			
			//Inserindo a solicitacao no banco de dados
			solicitacaoRepository.save(solicitacao);
			
			solicitacao.setId(solicitacao.getId());
			
			Timestamp dataDeHoje = new Timestamp(System.currentTimeMillis());
			
			//Setando a observacao para criacao da observacao da solicitacao criada
			Observacao observacao = new Observacao();
			observacao.setSolicitacao(solicitacao);
			observacao.setDtCriacao(dataDeHoje);
			observacao.setTexto(solicitacao.getComment().toUpperCase().trim());
			
			//Inserindo a observacao no banco de dados
			observacaoRepository.save(observacao);
			
			//Setando o historicoStatus para criacao do historicoStatus da solicitacao criada
			HistoricoStatus historicoStatus = new HistoricoStatus();
			historicoStatus.setDtHistorico(dataDeHoje);
			historicoStatus.setGrupoResponsavel(grupoResponsavel);
			historicoStatus.setStatusSolicitacao(statusSolicitacao);
			historicoStatus.setSolicitacao(solicitacao);
			
			//Inserindo o historicoStatus no banco de dados
			historicoStatusRepository.save(historicoStatus);
			
			jsonObject.put("solicitacao", "success");
			jsonObject.put("title", " Mensagem de Confirmação");
			jsonObject.put("message", "Solicitacao "+solicitacao.getId().toString() +" "+ message + " com sucesso!");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteSolicitacao(final Long id) {
		final JSONObject jsonObject = new JSONObject();
		try {
			solicitacaoRepository.delete(id);
			jsonObject.put("message", "Registro excluído com sucesso.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	@Override
	public List<Servico> servicoList() {
		return servicoRepository.findAll();
	}
	
}
