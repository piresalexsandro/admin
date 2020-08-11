package br.com.bigdataservices.entidade;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.format.annotation.DateTimeFormat;


/**
 * The persistent class for the solicitacao database table.
 * 
 */
@Entity
public class Solicitacao extends AbstractPersistable<Long> {
    
    private static final long serialVersionUID = -7890257533894362268L;

    private transient Long id;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    @Column(name="data_criacao")
    private Date dataCriacao;
	
	@Column(name="data_previsao")
	private String dataPrevisao;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    @Column(name="data_finalizacao")
    private Date dataFinalizacao;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    @Column(name="data_atualizacao")
    private Date dataAtualizacao;
	
	@Column(name="nr_solicitacao")
	private String nrSolicitacao;
	
	@Column(name="enviado_pagto")
	private String enviadoPagto;

	private BigDecimal valor;

	private String pago;
	
	private transient String clienteId;
	
	private transient String nomeCliente;
	
	private transient Long servicoId;
	
	private transient String comment;
	
	@ManyToOne
    @JoinColumn(name="id_cliente")
    private Cliente cliente;
	
	@ManyToOne
    @JoinColumn(name="id_servico")
    private Servico servico;
	
	@ManyToOne
    @JoinColumn(name="grupo_autorizacao")
    private GrupoUsuario grupoAutorizacao;
    
    @ManyToOne
    @JoinColumn(name="grupo_responsavel")
    private GrupoUsuario grupoResponsavel;
    
    //bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name="user_autorizacao")
    private User usuarioAutorizacao;
    
    //bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name="user_responsavel")
    private User usuarioResponsavel;
    
    //bi-directional many-to-one association to Status
    @ManyToOne
    @JoinColumn(name="status_solicitacao")
    private Status statusSolicitacao;
    
    //bi-directional many-to-one association to Status
    @ManyToOne
    @JoinColumn(name="status_anterior")
    private Status statusAnterior;

	//bi-directional many-to-one association to Anexo
	@OneToMany(targetEntity = Anexo.class, mappedBy = "solicitacao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Anexo> anexos;
	
	//bi-directional many-to-one association to Observacao
    @OneToMany(targetEntity = Observacao.class, mappedBy = "solicitacao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Observacao> observacoes;
    
    //bi-directional many-to-one association to HistoricoStatus
    @OneToMany(targetEntity = HistoricoStatus.class, mappedBy = "solicitacao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<HistoricoStatus> historicos;

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


	public String getDataPrevisao() {
		return this.dataPrevisao;
	}

	public void setDataPrevisao(String dataPrevisao) {
		this.dataPrevisao = dataPrevisao;
	}

	
	public String getEnviadoPagto() {
		return this.enviadoPagto;
	}

	public void setEnviadoPagto(String enviadoPagto) {
		this.enviadoPagto = enviadoPagto;
	}

	public String getNrSolicitacao() {
		return this.nrSolicitacao;
	}

	public void setNrSolicitacao(String nrSolicitacao) {
		this.nrSolicitacao = nrSolicitacao;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public String getPago() {
		return pago;
	}

	public void setPago(String pago) {
		this.pago = pago;
	}

	public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public Date getDataFinalizacao() {
        return dataFinalizacao;
    }

    public void setDataFinalizacao(Date dataFinalizacao) {
        this.dataFinalizacao = dataFinalizacao;
    }

    public Date getDataAtualizacao() {
        return dataAtualizacao;
    }

    public void setDataAtualizacao(Date dataAtualizacao) {
        this.dataAtualizacao = dataAtualizacao;
    }

    public String getClienteId() {
        return clienteId;
    }

    public void setClienteId(String clienteId) {
        this.clienteId = clienteId;
    }

    public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public Long getServicoId() {
		return servicoId;
	}

	public void setServicoId(Long servicoId) {
		this.servicoId = servicoId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public GrupoUsuario getGrupoAutorizacao() {
        return grupoAutorizacao;
    }

    public void setGrupoAutorizacao(GrupoUsuario grupoAutorizacao) {
        this.grupoAutorizacao = grupoAutorizacao;
    }

    public GrupoUsuario getGrupoResponsavel() {
        return grupoResponsavel;
    }

    public void setGrupoResponsavel(GrupoUsuario grupoResponsavel) {
        this.grupoResponsavel = grupoResponsavel;
    }

    public User getUsuarioAutorizacao() {
        return usuarioAutorizacao;
    }

    public void setUsuarioAutorizacao(User usuarioAutorizacao) {
        this.usuarioAutorizacao = usuarioAutorizacao;
    }

    public User getUsuarioResponsavel() {
        return usuarioResponsavel;
    }

    public void setUsuarioResponsavel(User usuarioResponsavel) {
        this.usuarioResponsavel = usuarioResponsavel;
    }

    public Status getStatusSolicitacao() {
        return statusSolicitacao;
    }

    public void setStatusSolicitacao(Status statusSolicitacao) {
        this.statusSolicitacao = statusSolicitacao;
    }

    public Status getStatusAnterior() {
        return statusAnterior;
    }

    public void setStatusAnterior(Status statusAnterior) {
        this.statusAnterior = statusAnterior;
    }

    public Set<Anexo> getAnexos() {
		return this.anexos;
	}

	public void setAnexos(Set<Anexo> anexos) {
		this.anexos = anexos;
	}

	public Anexo addAnexo(Anexo anexo) {
		getAnexos().add(anexo);
		anexo.setSolicitacao(this);
		return anexo;
	}

	public Anexo removeAnexo(Anexo anexo) {
		getAnexos().remove(anexo);
		anexo.setSolicitacao(null);
		return anexo;
	}

	@Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Solicitacao other = (Solicitacao) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}