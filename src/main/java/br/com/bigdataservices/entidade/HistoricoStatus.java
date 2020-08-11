package br.com.bigdataservices.entidade;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class HistoricoStatus extends AbstractPersistable<Long> {

    private static final long serialVersionUID = -2716348754532601761L;

    private transient Long id;
    
    @Column(name = "dt_historico")
    private Timestamp dtHistorico;

    // bi-directional many-to-one association to Status
    @ManyToOne
    @JoinColumn(name = "id_status_solicitacao")
    private Status statusSolicitacao;
    
    @ManyToOne
    @JoinColumn(name="grupo_autorizacao")
    private GrupoUsuario grupoAutorizacao;
    
    @ManyToOne
    @JoinColumn(name="grupo_responsavel")
    private GrupoUsuario grupoResponsavel;
    
    @ManyToOne
    @JoinColumn(name="user_autorizacao")
    private User usuarioAutorizacao;
    
    @ManyToOne
    @JoinColumn(name="user_responsavel")
    private User usuarioResponsavel;
    
    // bi-directional many-to-one association to Solicitacao
    @ManyToOne
    @JoinColumn(name = "id_solicitacao")
    private Solicitacao solicitacao;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Status getStatusSolicitacao() {
        return statusSolicitacao;
    }

    public void setStatusSolicitacao(Status statusSolicitacao) {
        this.statusSolicitacao = statusSolicitacao;
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

    public GrupoUsuario getGrupoAutorizacao() {
        return grupoAutorizacao;
    }

    public void setGrupoAutorizacao(GrupoUsuario grupoAutorizacao) {
        this.grupoAutorizacao = grupoAutorizacao;
    }

    public Solicitacao getSolicitacao() {
        return this.solicitacao;
    }

    public void setSolicitacao(Solicitacao solicitacao) {
        this.solicitacao = solicitacao;
    }
   
    public Timestamp getDtHistorico() {
        return dtHistorico;
    }

    public void setDtHistorico(Timestamp dtHistorico) {
        this.dtHistorico = dtHistorico;
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
        HistoricoStatus other = (HistoricoStatus) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
