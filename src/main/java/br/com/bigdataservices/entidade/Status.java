package br.com.bigdataservices.entidade;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Status extends AbstractPersistable<Long> {

    private static final long serialVersionUID = -2716348754532601761L;

    private transient Long id;

    private String nome;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "status")
    private List<ProximoStatus> proximosStatusList;

    private Boolean requerAutorizacao;

    @ManyToOne
    @JoinColumn(name="grupo_autorizacao")
    private GrupoUsuario grupoAutorizacao;

    private Long tempoSLALimite1;

    private Long tempoSLALimite2;

    private Boolean isTerminativo;

    @Column(name = "dt_criacao")
    private Timestamp dtCriacao;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public List<ProximoStatus> getProximosStatusList() {
        return proximosStatusList;
    }

    public void setProximosStatusList(List<ProximoStatus> proximosStatusList) {
        this.proximosStatusList = proximosStatusList;
    }

    public Boolean getRequerAutorizacao() {
        return requerAutorizacao;
    }

    public void setRequerAutorizacao(Boolean requerAutorizacao) {
        this.requerAutorizacao = requerAutorizacao;
    }

    public GrupoUsuario getGrupoAutorizacao() {
        return grupoAutorizacao;
    }

    public void setGrupoAutorizacao(GrupoUsuario grupoAutorizacao) {
        this.grupoAutorizacao = grupoAutorizacao;
    }

    public Long getTempoSLALimite1() {
        return tempoSLALimite1;
    }

    public void setTempoSLALimite1(Long tempoSLALimite1) {
        this.tempoSLALimite1 = tempoSLALimite1;
    }

    public Long getTempoSLALimite2() {
        return tempoSLALimite2;
    }

    public void setTempoSLALimite2(Long tempoSLALimite2) {
        this.tempoSLALimite2 = tempoSLALimite2;
    }

    public Boolean getIsTerminativo() {
        return isTerminativo;
    }

    public void setIsTerminativo(Boolean isTerminativo) {
        this.isTerminativo = isTerminativo;
    }

    public Timestamp getDtCriacao() {
        return dtCriacao;
    }

    public void setDtCriacao(Timestamp dtCriacao) {
        this.dtCriacao = dtCriacao;
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
        Status other = (Status) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
    
}
